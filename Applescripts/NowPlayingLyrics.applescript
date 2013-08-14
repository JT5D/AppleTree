tell application "iTunes"
	set trackString to (artist of current track) & " - " & (name of current track) & " (" & (album of current track) & ")"
	set trackLyrics to lyrics of current track
end tell
if trackLyrics is "" then
	display dialog "No Lyrics" buttons {"OK"} default button 1
else
	display dialog trackString default answer trackLyrics buttons {"OK"} default button 1
end if