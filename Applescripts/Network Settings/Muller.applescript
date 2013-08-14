tell application "Screen Sharing"
	activate
	
	tell application "System Events"
		keystroke "vnc://MullerBook%20Pro._rfb._tcp.local"
		keystroke return
		delay 1
		tell application "System Events"
			click (radio button 1 of radio group 1 of window 1) of application process "NetAuthAgent"
			keystroke return
		end tell
	end tell
	
end tell