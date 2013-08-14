set ip_address to do shell script "curl whatismyip.org"
tell application "System Events" to set the clipboard to ip_address
display dialog "IP Address is " & ip_address buttons {"OK"} default button 1