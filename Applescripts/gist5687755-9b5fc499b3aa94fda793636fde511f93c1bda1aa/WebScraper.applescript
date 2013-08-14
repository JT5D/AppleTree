-- Get the text from Safari
tell application "Safari"
  set thePageText to text of document 1
end tell

-- Split the text into paragraphs
set thePars to paragraphs of thePageText

-- Find all paragraphs matching the desired criteria
set theText to ""
repeat with aPar in thePars
	if aPar contains "www.myrepospace.com/profile" then
		set theText to theText & (aPar & return as string)
	end if
end repeat

-- Write the paragraphs to a file on the Desktop
set theOutputFile to (path to desktop folder as string) & "Results.txt"
try
	set theOutputFile to open for access theOutputFile with write permission
	write theText to theOutputFile starting at eof
	close access theOutputFile
on error
	close access theOutputFile
end try