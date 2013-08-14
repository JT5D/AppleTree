tell application "iTunes"
	
	if current track's class is URL track then
		set trackString to current stream title
	else
		set trackName to name of current track
		set trackArtist to artist of current track
		set trackAlbum to album of current track
		set trackString to trackArtist & " - " & trackName & " (" & trackAlbum & ")"
	end if
end tell

tell application "System Events" to set the clipboard to trackString

display dialog "Clipboard set to\n" & trackString buttons {"OK", "THL"} default button 1

if the button returned of the result is "THL" then
	tell application "The Hit List"
		tell inbox to make new task with properties {title:trackString}
	end tell
end if