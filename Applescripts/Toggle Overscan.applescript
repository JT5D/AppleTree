-- Inspired by Overscan_Toggle from http://forums.plexapp.com/index.php?/topic/856-mac-mini-and-screen-size-overscan-automatic-toggle/
tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.displays"
end tell

tell application "System Events"
	if UI elements enabled then
		tell tab group 1 of window 1 of process "System Preferences"
			click checkbox 1 of group 1 -- overscan button
			click checkbox 1 of group 1
		end tell
	end if
end tell

tell application "System Preferences"
	quit
end tell
