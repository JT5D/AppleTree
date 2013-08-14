#!/usr/bin/env ruby

require 'net/http'
require 'optparse'
require 'timeout'
require 'cgi'

class Hash
  def to_query_string
    map { |k, v| 
      if v.instance_of?(Hash)
        v.map { |sk, sv|
          "#{k}[#{sk}]=#{sv}"
        }.join('&')
      else
        "#{k}=#{v}"
      end
    }.join('&')
  end
end

module Pastie
  AVAILABLE_PARSERS = %w(
    c diff html javascript
    nitro_xhtml pascal plain_text
    rhtml ruby sql
  )

  class API
    PASTIE_URI = 'pastie.org'

    def paste(body, format='plaintext', is_private=false)
      raise InvalidParser unless valid_parser?(format)
      http = Net::HTTP.new(PASTIE_URI)
      query_string = { :paste => {
        :body => CGI.escape(body),
        :parser => format,
        :restricted => is_private,
        :authorization => 'burger'
      }}.to_query_string
      resp, body = http.start { |http|
        http.post('/pastes', query_string)
      }
      if resp.code == '302'
        return resp['location']
      else
        return nil
      end
    end

    private
      def valid_parser?(format)
        Pastie::AVAILABLE_PARSERS.include?(format)
      end
  end
  
end