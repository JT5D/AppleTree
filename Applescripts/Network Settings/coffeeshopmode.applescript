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
		if (exists button "Start") is true then
			click button "Start"
		end if
	end tell
end tell

# Turn off all sharing
tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preferences.sharing"
end tell
tell application "System Events"
	tell window "Sharing" of process "System Preferences"
		if (exists button "Click the lock to make changes.") is true then
			click button "Click the lock to make changes."
		end if
		
		repeat with theIncrementValue from 1 to 12
			set chbx to checkbox 1 of row theIncrementValue of table 1 of scroll area 1 of group 1
			if (value of chbx) is 1 then
				click chbx
				# Screen sharing takes a second to turn off
				# and if you exit too quickly it doesn't turn off
				# so delay if that's turning off
				if theIncrementValue is 2 then
					delay 1
				end if
			end if
			
		end repeat
	end tell
	
end tell
tell application "System Preferences"
	#quit
end tell