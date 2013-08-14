tell application "GrowlHelperApp"
	register as application "iCal Notice" all notifications ["Notice","Info"] default notifications ["Notice","Info"] icon of application "iCal"
	notify with name "Info" title "Current Time" description (current date) as string application name "iCal Notice" priority -2 identifier "Current Time" with sticky
end tell