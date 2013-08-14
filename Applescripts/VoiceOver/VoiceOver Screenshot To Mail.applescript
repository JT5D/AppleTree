(* 
Takes a screenshot of what is in the VoiceOver cursor and adds the 
image as an attachment to a new Mail message

Copyright 2008 Apple Inc. All rights reserved.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
*)

global screenshotPath

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

set screenshotPath to ""

if isVoiceOverRunningWithAppleScript() then
	tell application "VoiceOver"
		tell vo cursor
			set screenshotPath to grab screenshot
		end tell
	end tell
else
	display dialog "VoiceOver must be running with AppleScript support enabled"
	return
end if

tell application "Mail"
	set newMessage to make new outgoing message with properties {visible:true, subject:"VoiceOver Cursor Screenshot", content:"VoiceOver Cursor screenshot:" & return & return}
	tell newMessage
		tell content
			make new attachment with properties {file name:screenshotPath} at after last paragraph
		end tell
	end tell
end tell

