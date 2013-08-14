set volume 10
tell application "iTunes"
	set the sound volume to 100
	try
		play playlist "radio"
	on error
		play playlist "iTunes DJ"
	end try
end tell
