#!/usr/bin/ruby

# Dropzone calls this first
# Loads a destination script and calls the appropriate method

$:.unshift(File.dirname(__FILE__)) if RUBY_VERSION > '1.9'

SCRIPTS_DIR = File::expand_path("~/Library/Application Support/Dropzone/Destination Scripts")

# Check runner is being called from within the lib directory
if Dir.pwd.split(File::SEPARATOR)[-1] != "lib"
  puts "Runner must be called from the within the lib directory"
  Process.exit
end

require 'dropzone'
require 'rsync'
require 'zip_files'
require 'ftp'
require 'flickr'
require 'pastie_api'
require 'is_gd'

if ARGV.length < 2
  puts "Wrong number of arguments"
  Process.exit
end

$dz = Dropzone.new

script = ARGV[0]

if (File.extname(script).downcase == ".dropzone")
  action = ARGV[1]
  $items = ARGV[2..-1]
  
  if script[0..2] == "../"
    # Called with relative path
    load File::expand_path(script[3..-1], SCRIPTS_DIR)
  elsif script.count("/") > 0
    # Called with full path
    load script
  else
    # Called by name, prefix destination scripts directory path
    load File::expand_path(script, SCRIPTS_DIR)
  end

  method(action).call
else
  puts "Filename error"
end