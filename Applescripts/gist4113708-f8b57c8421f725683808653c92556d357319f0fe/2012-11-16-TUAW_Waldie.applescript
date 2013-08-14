-- Get the path to the Evernote templates folder
set theTemplatesFolder to (path to documents folder as string) & "Evernote Templates:" as alias

-- Retrieve a list of template file names without their .enex extensions
set theTemplateNames to list folder theTemplatesFolder without invisibles
repeat with a from 1 to length of theTemplateNames
	set aTemplate to item a of theTemplateNames
	if aTemplate contains ".enex" then set aTemplate to text 1 thru -6 of aTemplate
	set item a of theTemplateNames to aTemplate
end repeat

-- Ask the user to select a template
set theTemplateChoice to choose from list theTemplateNames with prompt "Please select the desired template:" default items {item 1 of theTemplateNames}
if theTemplateChoice = false then return
set theTemplateName to item 1 of theTemplateChoice

-- Ask the user to enter a name for the new notebook
set theNotebookName to text returned of (display dialog "What would you like to name this " & theTemplateName & " notebook?" default answer (short date string of (current date)) & " - " & theTemplateName)

-- Determine the path to the specified template file
set theTemplatePath to theTemplatesFolder & theTemplateName & ".enex" as string as alias

-- Create a new notebook and import the template file
tell application "Evernote"
	set theNotebook to create notebook theNotebookName with type synchronized
	import theTemplatePath to theNotebook with tags
	
	-- Find the newly created notebook notes
	set query string of front window to ("notebook:\"" & theNotebookName & "\"" as string)
end tell