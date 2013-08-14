(*
Probe Window

This script uses UI element scripting to get information about the top window in the Finder.

If "Enable access for assistive devices" is not checked,
this script will open the Universal Access System Preference and ask
the user to check the checkbox.

Copyright © 2007 Apple Inc.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
*)

tell application "Finder"
	activate
end tell

tell application "System Events"
	get properties
	if UI elements enabled then
		tell process "Finder"
			
			get every UI element
			
			tell window 1
				
				get every button
				get properties of every button
				get every UI element of every button
				
				get every static text
				get properties of every static text
				get every UI element of every static text
				
				get every scroll bar
				get properties of every scroll bar
				get every UI element of every scroll bar
				
				get every UI element Â
					whose class is not button and class is not static text Â
					and class is not scroll bar
				get properties of every UI element Â
					whose class is not button and class is not static text Â
					and class is not scroll bar
				
			end tell
			
		end tell
	else
		tell application "System Preferences"
			activate
			set current pane to pane "com.apple.preference.universalaccess"
			display dialog "UI element scripting is not enabled. Check \"Enable access for assistive devices\""
		end tell
	end if
end tell