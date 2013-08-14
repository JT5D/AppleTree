#!/usr/bin/ruby

require 'net/ftp'
require 'socket'
require 'timeout'

class FTP

  def self.do_upload(source_files, destination, host_info)
    last_percent = 0
    last_uploaded_path = ""
    set_determinate = false
    uploaded_file_paths = []
    
    host_info = self.sanitize_host_info(host_info)
    destination = (destination != nil ? destination : "/")
    
    self.upload(source_files, destination, host_info[:server], host_info[:port], 
                                           host_info[:username], host_info[:password]) do |percent, remote_path|
      remote_file = remote_path.split(File::SEPARATOR)[-1]
      
      if remote_path != last_uploaded_path
        $dz.begin("Uploading #{remote_file}...")
        uploaded_file_paths << remote_path
      end
      
      last_uploaded_path = remote_path
      
      if not set_determinate
        # Switch to determinate now file sizes have been calculated and upload is beginning
        $dz.determinate(true)
        set_determinate = true
      end
      
      $dz.percent(percent) if last_percent != percent
      last_percent = percent
    end
    
    return uploaded_file_paths
  end

  def self.upload(localpaths, remotedir, host, port, user, pass, &block)
    ftp = Net::FTP.new
    alert_title = "FTP Upload Error"
    
    begin
	ftp.connect(host, port)
	ftp.login(user, pass)
	
    rescue Timeout::Error
      $dz.error(alert_title, "Connection timed out.")
    rescue SocketError
      $dz.error(alert_title, "Server not found.")
    rescue
      $dz.error(alert_title, $!)
    end
    
    ftp.passive = true

    files = []
    size  = 0

    localpaths.each do |localpath|
      path = self.path_contents(localpath, remotedir)
      files.concat path[:files]
      size += path[:size]
    end

    transferred = 0
    $dz.begin("Uploading #{files.size} files...") if files.length > 1 
    files.each do |local, remote|
      if local.empty? then
        # Try to create the directory
        begin
          ftp.mkdir remote
        rescue
          # Remote already exists?
        end
      else
        begin
          # Send the file
          ftp.putbinaryfile(local, remote) do |data|
            transferred += data.length
            percent = (transferred * 100 / size)
            yield percent, remote
          end
        rescue
          $dz.error(alert_title, $!)
        end
      end
    end
    ftp.close
  end

  def self.path_contents(localfile, remotedir)
    files = []
    size  = 0
    filestat = File.stat(localfile)

    # Check if this is a file or directory
    if filestat.directory? then
      remotedir += ('/' + File.basename(localfile)).gsub('//', '/')
      # Make sure we create the remote directory later
      files.push ['', remotedir]
      # Recurse through dir
      Dir.foreach localfile do |file|
        next if file == '.' or file == '..'
        local = (localfile + '/' + file).gsub('//', '/')
        begin
          p = path_contents(local, remotedir)
        rescue
          next
        end
        size += p[:size]
        files.concat p[:files]
      end

    elsif filestat.file? then
      # Increment the size
      size += File.size localfile;
      remotefile = (remotedir + '/' + File.basename(localfile)).gsub('//', '/')
      files.push [localfile, remotefile]
    end
    return { :files => files, :size => size }
  end
  
  def self.sanitize_host_info(host_info)
    host_info[:port] = (host_info[:port] != nil ? host_info[:port].to_i : 21)
    return host_info
  end
  
  def self.test_connection(host_info)
    ftp = Net::FTP.new
    host_info = self.sanitize_host_info(host_info)
    error_title = "Connection Failed"
    
    begin
      timeout(20) {
        ftp.connect(host_info[:server], host_info[:port])
        ftp.login(host_info[:username], host_info[:password])
      }
    rescue Timeout::Error
      $dz.error(error_title, "Connection timed out.")
    rescue SocketError
      $dz.error(error_title, "Server not found.")
    rescue
      $dz.error(error_title, $!)
    end
    
    $dz.alert("Connection Successful", "FTP connection succeeded.")
  end

end
