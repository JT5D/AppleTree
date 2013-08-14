#!/usr/bin/env ruby

class ZipFiles
  
  def self.zip(items, filename)
    $dz.begin("Copying files...")
    tmp_folder = "/tmp/dz_tmp/"
    zip_file = "\"/tmp/#{filename}\""
    system("/bin/mkdir #{tmp_folder} >& /dev/null")
    Rsync.do_copy(items, tmp_folder, false)
    $dz.begin("Creating zip archive...")
    $dz.determinate(false)
    system("/usr/bin/ditto -c -k -X --rsrc #{tmp_folder} #{zip_file} >& /dev/null")
    system("/bin/rm -rf #{tmp_folder} >& /dev/null")
    return zip_file
  end
  
  def self.delete_zip(zip_file)
    system("/bin/rm -f #{zip_file} >& /dev/null")
  end
  
end