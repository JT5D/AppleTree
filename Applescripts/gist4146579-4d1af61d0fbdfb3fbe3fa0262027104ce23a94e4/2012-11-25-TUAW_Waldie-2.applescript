-- Ask the user to enter some preliminary values for positioning and sizing the windows
set theTopOffset to askForInput("How many pixels would you like between the menu bar and the first window?", 10)
set theLeftOffset to askForInput("How many pixels would you like between the left of the screen and the first window?", 10)
set theWindowHeight to askForInput("How many pixels high would you like each window?", 300)
set theWindowWidth to askForInput("How many pixels wide would you like each window?", 350)
set theWindowOffset to askForInput("How many pixels would you like the windows offset from one another?", 25)
set staggerWindows to (button returned of (display dialog "Would you like the windows to cascade to the right?" buttons {"No", "Yes"} default button "Yes")) = "Yes"

-- Compensate for the menu bar
set theTopOffset to theTopOffset + 45

-- Get the parent folders of any opened windows
tell application "Finder"
	set theFolders to folder of every window
	
	-- Sort the folders by name
	set theFolders to sort theFolders by name
	
	-- Prepare the bounds list for the first window
	set theWindowBounds to {theLeftOffset, theTopOffset, theLeftOffset + theWindowWidth, theTopOffset + theWindowHeight}
	
	-- Loop through the folders
	repeat with aFolder in theFolders
		
		-- Target the container window of the current folder
		tell container window of aFolder
			
			-- Set the bounds of the window to the new bounds
			set bounds to theWindowBounds
			
			-- Offset the bounds of the next window down the appropriate amount
			set item 2 of theWindowBounds to (item 2 of theWindowBounds) + theWindowOffset
			set item 4 of theWindowBounds to (item 4 of theWindowBounds) + theWindowOffset
			
			-- If the windows should be staggered, offset the bounds of the next window right the appropriate amount
			if staggerWindows = true then
				set item 1 of theWindowBounds to (item 1 of theWindowBounds) + theWindowOffset
				set item 3 of theWindowBounds to (item 3 of theWindowBounds) + theWindowOffset
			end if
		end tell
	end repeat
end tell

-- Ask the user to enter a value
on askForInput(theQuestion, theDefaultAnswer)
	return text returned of (display dialog theQuestion default answer theDefaultAnswer)
end askForInput