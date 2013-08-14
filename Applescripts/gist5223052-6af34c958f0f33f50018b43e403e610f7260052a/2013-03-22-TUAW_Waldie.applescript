-- Options to process a maximum number of messages
property limitMessageProcessing : true
property theMaxMessagesToProcess : 5

-- The voice to use when speaking. This should be one of the voices in System Preferences > Dictation & Speech > Text to Speech
property theVoice : "Alex"

-- Tihs setting controls whether the script raises the volume to speak, if needed.
property raiseVolumeIfNeeded : true

-- This setting controls the minimum volume level for the message.  This should be a value from 1 to 100.
property theMinimumVolumeLevel : 50

-- This setting controls whether the first paragraph of the message is read.
property readFirstParagraphsOfEachMessage : true

-- This setting controls the maximum number of paragraphs to read.
property theMaximumParagraphsToRead : 3

-- This code is triggered if you manually run the script in AppleScript Editor. It retreives any selected messages and then processes them. This is good for testing.
tell application "Mail"
	set theMessages to selection
	tell me to perform mail action with messages theMessages
end tell

-- Since the "perform mail action" terminology belongs to Mail, we need to tell AppleScript to look to Mail for it. 
using terms from application "Mail"
	
	-- This handler is triggered by a Mail rule when messages matching the specified critria are detected.
	on perform mail action with messages theMessages
		
		-- Count the messages received from Mail.
		set theMessageCount to count theMessages
		
		-- Begin preparing the announcement text.
		set theAnnouncement to "You have mail!"
		if theMessageCount = 1 then
			set theAnnouncement to theAnnouncement & " There is 1 new message."
		else
			set theAnnouncement to theAnnouncement & " There are " & theMessageCount & " new messages."
		end if
		
		-- Raise the volume, if needed
		if raiseVolumeIfNeeded = true then
			set thePreviousVolume to output volume of (get volume settings)
			set previousVolumeMuted to output muted of (get volume settings)
			if thePreviousVolume is less than theMinimumVolumeLevel then
				set volume output volume theMinimumVolumeLevel
			else
				set volume output volume thePreviousVolume
			end if
		end if
		
		-- Speak the announcement text.
		say theAnnouncement using theVoice
		
		-- Loop through the messages received from Mail.
		tell application "Mail"
			repeat with a from 1 to theMessageCount
				
				-- Stop processing after the maximum number of allowable messages
				if limitMessageProcessing = true then
					if a is greater than theMaxMessagesToProcess then exit repeat
				end if
				
				-- Target the current message in the loop.
				tell item a of theMessages
					
					-- Retrieve the name of the current message's sender.
					set theSenderName to (extract name from sender)
					
					-- Retrieve the current message's subject.
					set theSubject to subject
					
					-- Customize the announcement text, based on whether the current message is a forward or reply.  Also, trim off any "Re: " and "Fwd: " prefixes.
					set theMessageType to "message"
					if theSubject begins with "Re: " then
						set theMessageType to "reply"
						if theSubject = "Re: " then
							set theSubject to ""
						else
							set theSubject to (characters 5 thru -1 of theSubject) as string
						end if
					else if theSubject begins with "Fwd: " then
						set theMessageType to "forwarded message"
						if theSubject = "Fwd: " then
							set theSubject to ""
						else
							set theSubject to (characters 6 thru -1 of theSubject) as string
						end if
					end if
					
					-- Prepare the message sender and subject text.
					set theMessageAnnouncement to " New " & theMessageType & " from " & theSenderName
					if theSubject = "" then
						set theMessageAnnouncement to theMessageAnnouncement & ". No subject was specified."
					else
						set theMessageAnnouncement to theMessageAnnouncement & " with subject \"" & theSubject & "\"."
					end if
					
					-- Add the message body text, if necessary.
					if readFirstParagraphsOfEachMessage = true then
						set theBody to content
						if theBody is not equal to "" then
							set theMessageAnnouncement to theMessageAnnouncement & " The message begins: "
							set theParagraphCount to 1
							repeat with b from 1 to count paragraphs of theBody
								set theCurrentParagraph to paragraph b of theBody
								if theCurrentParagraph is not equal to "" then
									set theMessageAnnouncement to theMessageAnnouncement & paragraph b of theBody
									if theParagraphCount = theMaximumParagraphsToRead then exit repeat
									set theParagraphCount to theParagraphCount + 1
								end if
							end repeat
						end if
					end if
					
					-- Speak the message text.
					say theMessageAnnouncement using theVoice
				end tell
			end repeat
		end tell
		
		-- Once all messages have been processed, speak the announcement text.
		say "No more messages." using theVoice
		
		-- Reset the volume to its previous level, if needed
		if raiseVolumeIfNeeded = true then
			set volume output volume thePreviousVolume output muted previousVolumeMuted
		end if
	end perform mail action with messages
end using terms from