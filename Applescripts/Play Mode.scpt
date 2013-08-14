--==============
--turn Growl On
--==============
tell application "GrowlHelperApp" to launch
tell application "GrowlHelperApp"
	set the allNotificationsList to {"Growl Toggler"}
	register as application "Growl Toggler" all notifications allNotificationsList default notifications allNotificationsList
	notify with name "Growl Toggler" title "Notifications ON" description "" application name "Growl Toggler" icon of application "Automator"
end tell

--==============
--Close timeEdition, iCal, and Backdrop
--==============
tell application "timeEdition" to quit
tell application "iCal" to quit
tell application "Backdrop" to quit

--==============
--Show Dock
--==============
tell application "System Events"
	keystroke "d" using {command down, option down}
end tell

--==============
--Set Adium to Available
--==============
-- set to away
set theMessage to "Available"

tell application "Adium"
	repeat with theAccount in accounts
		set theStatus to status type of status of theAccount
		
		(*
		set theTitle to title of theAccount
		set theDebugMessage to "Account: " & theTitle & " Status: " & (theStatus as string)
		tell application "Finder" to display dialog theDebugMessage
		*)
		
		if (theStatus is available) then
			go away theAccount with message theMessage
		else if (theStatus is away) then
			go available theAccount with message theMessage
		end if
	end repeat
end tell