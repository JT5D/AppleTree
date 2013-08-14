tell application "GrowlHelperApp"
	register as application "iCal Notice" all notifications ["Notice","Info"] default notifications ["Notice","Info"] icon of application "iCal"
	notify with name "Notice" title "Leave for Work" description (current date) as string application name "iCal Notice" priority 1 with sticky
end tell
