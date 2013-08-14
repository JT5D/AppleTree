(* 
Speaks the number of new messages in your Inbox

Copyright 2008 Apple Inc. All rights reserved.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
*)

on isVoiceOverRunning()
	set isRunning to false
	tell application "System Events"
		set isRunning to (name of processes) contains "VoiceOver"
	end tell
	return isRunning
end isVoiceOverRunning

on isVoiceOverRunningWithAppleScript()
	if isVoiceOverRunning() then
		set isRunningWithAppleScript to true
		
		-- is AppleScript enabled on VoiceOver --
		tell application "VoiceOver"
			try
				set x to bounds of vo cursor
			on error
				set isRunningWithAppleScript to false
			end try
		end tell
		return isRunningWithAppleScript
	end if
	return false
end isVoiceOverRunningWithAppleScript

on unreadMailCount()
	tell application "Mail"
		set unreadCount to 0 as number
		set everyAccount to every account
		repeat with eachAccount in everyAccount
			set accountMailboxes to every mailbox of eachAccount
			repeat with eachMailbox in accountMailboxes
				ignoring case
					if name of eachMailbox is equal to "Inbox" then
						tell eachMailbox
							set unreadCount to (count of (messages whose read status is false)) + unreadCount
						end tell
					end if
				end ignoring
			end repeat
		end repeat
		return unreadCount
	end tell
end unreadMailCount

set unreadString to ""
set unreadCount to unreadMailCount()

if unreadCount is equal to 1 then
	set unreadString to unreadCount & " unread message" as string
else
	set unreadString to unreadCount & " unread messages" as string
end if


if isVoiceOverRunningWithAppleScript() then
	tell application "VoiceOver"
		output unreadString
	end tell
else
	say unreadString
	delay 2
end if