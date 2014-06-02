property bookmarkFolderPath : "~/Library/Application Support/memarks/Bookmarks/"
property bookmarkFileName : "Evernote Bookmarks.html"

on run
	my makeFolderFromPOSIXPath(bookmarkFolderPath)
	set quotedBookmarkFilePath to quoted form of my expandPOSIXPath(bookmarkFolderPath & bookmarkFileName)
	do shell script "echo \"\" > " & quotedBookmarkFilePath
	set errorCount to 0
	tell application "Evernote"
		set foundNotes to find notes "sourceURL:*"
		set foundNotesCount to count of foundNotes
		
		repeat with i from 1 to foundNotesCount
			-- No sense in bailing for one error
			try
				set bmNote to item i of foundNotes
				
				(*
				-- Build a name attribute based on tags
				-- LB doesn't index that attribute, ditched
				
				set bmTags to tags of bmNote
				set bmTagString to ""
				if (count of bmTags) > 0 then
					repeat with ti from 1 to count of bmTags
						set bmTagString to bmTagString & " " & name of item ti of bmTags
					end repeat
				end if
				
				set bmURL to "<a href=\"" & source URL of bmNote & "\" name=\"" & bmTagString & "\">" & title of bmNote & "</a>" & (return)
				
				*)
				
				set bmURL to "<a href=\"" & source URL of bmNote & "\">" & title of bmNote & "</a>" & (return)
				
				
				do shell script "echo " & quoted form of bmURL & " >> " & quotedBookmarkFilePath
			on error errmsg number errnum from errobj
				
				set errorCount to errorCount + 1
				set foundNotesCount to foundNotesCount - 1
			end try
		end repeat
		return "Exported " & foundNotesCount & " Evernote Bookmarks. " & errorCount & " errors"
	end tell
end run


-- Makes a folder, returns it as an alias
on makeFolderFromPOSIXPath(folderPath)
	set expandedFolderPath to my expandPOSIXPath(folderPath)
	do shell script "mkdir -p " & quoted form of expandedFolderPath
	return POSIX file expandedFolderPath as alias
end makeFolderFromPOSIXPath


-- Why is this so damn hard? Makes a full POSIX path if there are abbreviations like a ~ or $PATH variable
on expandPOSIXPath(rawPath)
	set oldTIDs to (AppleScript's text item delimiters)
	set AppleScript's text item delimiters to {"/"}
	set rawPathParts to text items of rawPath
	
	get item 1 of rawPathParts
	result is "~"
	
	
	
	set expandedPath to ""
	set AppleScript's text item delimiters to {""}
	repeat with n from 1 to (count of rawPathParts)
		set pathPart to item n of rawPathParts
		
		if pathPart is "~" then
			
			do shell script "echo $HOME"
			set expandedPath to expandedPath & result
			
		else if length of pathPart is 0 then
			
			set expandedPath to expandedPath & "/"
		else if pathPart is "~" then
			set expandedPath to expandedPath & "echo $HOME"
		else if first character of pathPart is "$" and pathPart does not contain " " then
			
			do shell script "echo " & pathPart
			set expandedPath to expandedPath & result
		else
			set expandedPath to expandedPath & "/" & pathPart
		end if
	end repeat
	set AppleScript's text item delimiters to oldTIDs
	return expandedPath
end expandPOSIXPath