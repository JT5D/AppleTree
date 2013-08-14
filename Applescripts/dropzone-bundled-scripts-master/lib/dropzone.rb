#!/usr/bin/ruby

class Dropzone
  $VERBOSE = nil
	$stdout.sync = true;

  def determinate(value)
    output = (value ? "Determinate: 1" : "Determinate: 0")
    send_output(output)
  end
  
  def begin(message)
    send_output("Begin_Message: #{message}")
  end
  
  def finish(message)
    send_output("Finish_Message: #{message}")
  end
  
  def alert(title, message)
    send_output("Alert_Title: #{title}")
    send_output("Alert: #{message}")
  end
  
  def error(title, message)
    send_output("Error_Title: #{title}")
    send_output("Error: #{message}")
    Process.exit
  end
  
  def percent(value)
    send_output("Progress: #{value}")
  end
  
  def url(url)
    (url ? send_output("URL: #{url}") : send_output("URL: 0"))
  end
  
  def text(text)
    (text ? send_output("Text: #{text}") : send_output("Text: 0"))
  end
  
  def send_output(line)
    puts line
	  # Block until acknowledgement
	  line = $stdin.gets
  end
end
