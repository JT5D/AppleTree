-- Prepare a name for the test folder
set theRootFolderName to "Cascade Windows Test"

-- Close any opened windows
tell application "Finder"
	close every window
	
	-- Locate the test folder, creating it if it doesn't exist
	if folder theRootFolderName of desktop exists then
		set theRootFolder to folder theRootFolderName of desktop
	else
		set theRootFolder to make new folder at desktop with properties {name:theRootFolderName}
	end if
	
	-- Loop for 10 test subfolders
	repeat with a from 1 to 10
		
		-- Determine the current test subfolder's name
		set theCurrentFolderName to "Test Folder " & a
		
		-- Locate the test folder, creating it if it doesn't exist
		if folder theCurrentFolderName of theRootFolder exists then
			set theFolder to folder theCurrentFolderName of theRootFolder
		else
			set theFolder to make new folder at theRootFolder with properties {name:theCurrentFolderName}
		end if
		
		-- Open the current test subfolder
		open theFolder
		
		-- Create random left and top positions for the current folder's window
		set theLeft to random number from 10 to 1024 as integer
		set theTop to random number from 10 to 768 as integer
		
		-- Create a random width and a random height for the current folder's window
		set theWidth to random number from 200 to 400 as integer
		set theHeight to random number from 200 to 400 as integer
		
		-- Adjust the bounds of the current window, based on the random values
		tell window of theFolder
			set bounds to {theLeft, theTop, theLeft + theWidth, theTop + theHeight}
			
			-- Hide the sidebar of each window
			set sidebar width to 0
		end tell
	end repeat
end tell