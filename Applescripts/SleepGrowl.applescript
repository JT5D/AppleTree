tell application "GrowlHelperApp"
	register as application "iCal Notice" all notifications ["Notice","Info"] default notifications ["Notice","Info"] icon of application "iCal"
	notify with name "Notice" title "Sleep" description "Go to sleep" application name "iCal Notice" priority 1 icon of application "Alarm Clock" with sticky
end tell