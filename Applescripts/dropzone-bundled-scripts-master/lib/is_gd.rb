#!/usr/bin/env ruby

require 'open-uri'
require 'net/http'

# is_gd is a library to minify URLs using http://is.gd service
# More info here: http://is.gd/api_info.php
class IsGd
  IS_GD_URL = "http://is.gd/api.php?longurl="
  USER_AGENT = "is_gd ruby library http://is-gd.rubyforge.org"
  attr_reader :original_url, :minified_url
  def initialize(url=nil)
    @original_url = url
    @minified_url = nil
    @un_minified_url = nil
  end
  
  # Take a URL and return a minified url
  def minify(url=nil)
    unless @minified_url
      url_to_minify = url || @original_url
      @minified_url = open(IS_GD_URL + url_to_minify, 'r') { |file| file.read }
    else
      @minified_url
    end    
  end
  
  # Class method to minify a URL
  def self.minify(url)
    is_gd = self.new(url)
    is_gd.minify
  end
  
  # Un-minify by following the redirect. If there is no redirect, then it returns the original URL
  def un_minify(url=nil)
    uri_str = url || @original_url
    
    unless @un_minified_url
      url_obj = URI.parse(uri_str)
      Net::HTTP.start(url_obj.host, url_obj.port) do |http|
        response = http.request_head(url_obj.request_uri, {'User-Agent' => USER_AGENT})
        
        case response
          when Net::HTTPSuccess then @un_minified_url = uri_str
          when Net::HTTPRedirection then @un_minified_url = response['location']
        end
        
        @un_minified_url
      end
      
    else
      @un_minified_url
    end
  end
  
  def self.un_minify(url)
    is_gd = IsGd.new(url)
    is_gd.un_minify
  end
  
end

# if the file is called directly
if __FILE__ == $0
  STDERR.puts "Getting smaller url for #{ARGV[0]}."
  puts IsGd.minify(ARGV[0])
end