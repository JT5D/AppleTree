tell application "TextEdit"
	activate
end tell

tell application "System Events"
	if UI elements enabled then
		tell process "TextEdit"
			set frontmost to true
		end tell
		
		key down option
		keystroke "e"
		delay 1
		key up option
		keystroke "e"
		keystroke return
		
		keystroke "e" using option down
		delay 1
		keystroke "e"
		keystroke return
		
		key down shift
		keystroke "p"
		key up shift
		keystroke return
		
		key down option
		keystroke "p"
		key up option
		keystroke return
		
		key down {shift, option}
		keystroke "p"
		key up {shift, option}
		keystroke return
		
		keystroke "p" using {shift down, option down}
		keystroke return
		
	else
		tell application "System Preferences"
			activate
			set current pane to pane "com.apple.preference.universalaccess"
			display dialog "UI element scripting is not enabled. Check \"Enable access for assistive devices\""
		end tell
	end if
end tell
