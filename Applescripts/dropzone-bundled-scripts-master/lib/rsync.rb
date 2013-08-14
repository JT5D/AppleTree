#!/usr/bin/env ruby

$REPLACE_DIALOG_PATH = "ReplaceDialog.app/Contents/MacOS/ReplaceDialog"
require 'fileutils'

class Rsync

  def self.do_copy(source_files, destination, remove_sent, output_progress = true)  
    files = ""
    replace_result = "YES"
    existing_files = []
    remove_files = []
    
    # Check if any files already exist at the destination
    source_files.each do |file|
      base_name = File.basename(file)
      if File::exists?(destination.chomp("/") + "/" + base_name)
        existing_files << file
      end
    end

    source_files.each do |file|
      # Do not add the file if the source and destination directories are the same
      if destination.chomp("/") != File.dirname(file).chomp("/")      
        base_name = File.basename(file)
      
        if existing_files.include?(file) and not replace_result =~ /YES-ALL/ and not replace_result =~ /NO-ALL/
          # File exists
          escaped_base_name = base_name.gsub(/["`$\\]/){ |s| '\\' + s }
          if existing_files.length > 1
            replace_result = `#{$REPLACE_DIALOG_PATH} \"#{escaped_base_name}\" multiple 2>&1`
          elsif existing_files.length == 1
            replace_result = `#{$REPLACE_DIALOG_PATH} \"#{escaped_base_name}\" 2>&1`
          end
        end  
      
        if replace_result =~ /STOP/
          $dz.finish("Cancelled")
          $dz.url(false)
          Process.exit
        end
        escaped_file = file.gsub(/["`$\\]/){ |s| '\\' + s }
        
        if replace_result =~ /YES/ or replace_result =~ /YES-ALL/
          remove_files << base_name
          files += "\"#{escaped_file}\" "
        end
      end
    end
  
    return false if files == ""
  
    escaped_destination = destination.gsub(/["`$\\]/){ |s| '\\' + s }
  
    if (!remove_sent)    
      # Use Rsync
      
      # Normally we don't copy extended attributes as this causes problems when copying to network mounted drives
      # but this can be overridden with the $rsync_copy_extended_attributes global
      extended_attributes_option = ($rsync_copy_extended_attributes ? "-E" : "")
    
      # First we do a dry run to get the number of files to be copied
      stats = `/usr/bin/rsync #{extended_attributes_option} --ignore-times -a --stats --dry-run #{files} \"#{escaped_destination}\" 2> /dev/null`
      num_files = stats.split("\n")[2].split(" ")[4]

      overall_percent = 0
      last_output = 0

      # Now run the actual transfer and output the progress perecent
      remove_sent_option = (remove_sent ? "--remove-sent-files" : "")
      rsync = IO.popen("/usr/bin/rsync #{extended_attributes_option} #{remove_sent_option} --ignore-times -a --progress --out-format \"\" #{files} \"#{escaped_destination}\" 2>&1 | tr -u \"\r\" \"\n\"") do |f|
        while line = f.gets do
          if line =~ /%/
            line_split = line.split(" ")
            file_percent = line_split[1][0..-2]
            output = ((file_percent.to_f + overall_percent) / num_files.to_f).to_i
            $dz.percent(output) if last_output != output and output_progress
            last_output = output
            overall_percent += file_percent.to_f if line =~ /xfer/
          end
        end
      end
    else
      # Use mv command
      # Need to remove any already existing directories that we are replacing first
      remove_files.each do |file|
        if not file.strip.empty?
          destination_file_path = destination.chomp("/") + "/" + file
          if File::exists?(destination_file_path) and File::directory?(destination_file_path)
            FileUtils.rm_rf(destination_file_path)
          end
        end
      end
      
      mv_output = `/bin/mv -f #{files} \"#{escaped_destination}\" 2>&1`
    end
    
    return true
  end
end