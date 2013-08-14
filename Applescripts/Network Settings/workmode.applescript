# Turn off Firewall if it's on.
tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.security"
end tell

tell application "System Events"
	tell window "Security & Privacy" of process "System Preferences"
		if (exists button "Click the lock to make changes.") is true then
			click button "Click the lock to make changes."
		end if
	end tell
	tell tab group 0 of window "Security & Privacy" of process "System Preferences"
		click radio button "Firewall"
		delay 1
		if (exists button "Stop") is true then
			click button "Stop"
		end if
	end tell
end tell

# Turn on some sharing services
# File sharing, ssh and vnc
tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preferences.sharing"
end tell
tell application "System Events"
	tell window "Sharing" of process "System Preferences"
		if (exists button "Click the lock to make changes.") is true then
			click button "Click the lock to make changes."
		end if
		
		set enabledServices to {2, 3, 7}
		repeat with theCheckbox in enabledServices
			set chbx to checkbox 1 of row theCheckbox of table 1 of scroll area 1 of group 1
			if (value of chbx) is 0 then
				click chbx
			end if
			
		end repeat
	end tell
end tell
tell application "System Preferences"
	#quit
end tell