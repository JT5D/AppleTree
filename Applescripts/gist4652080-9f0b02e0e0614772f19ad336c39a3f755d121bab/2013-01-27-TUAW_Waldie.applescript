-- Receive images as input
on open theImages
  
	-- Ask the user to specify a scaled image size
	set theChoice to choose from list {"Low", "Medium", "High", "Custom"} default items {"Medium"} with title "Evernote > Scale Images Script" with prompt "Scale to what size?"
	if theChoice = false then return
	set theChoice to item 1 of theChoice
	
	-- Set the maximum number of pixels accordingly, based on the specified scaled image size
	if theChoice = "Low" then
		set theMaxSize to 320
	else if theChoice = "Medium" then
		set theMaxSize to 640
	else if theChoice = "High" then
		set theMaxSize to 1280
		
		-- If the user chose a custom size, ask the user to specify a maximum number of pixels
	else
		set theIcon to note
		set thePrefix to ""
		repeat
			set theMaxSize to text returned of (display dialog thePrefix & "Please specify a maximum number of pixels for the longest side:" default answer "320" with icon theIcon)
			try
				set theMaxSize to theMaxSize as integer
				exit repeat
			on error
				set thePrefix to "You must enter a number. "
				set theIcon to caution
			end try
		end repeat
	end if
	
	-- Loop through the images received as input
	repeat with a from 1 to length of theImages
		set theImage to ((item a of theImages) as string) as alias
		
		-- Launch the background image processor in OS X
		tell application "Image Events"
			launch
			
			-- Open the image
			set theImage to open theImage
			tell theImage
				
				-- Get the image's current dimensions
				set theDimensions to dimensions
				
				-- Scale the image if it's larger than the maximum number of pixels
				if theMaxSize is less than (item 1 of theDimensions) or theMaxSize is less than (item 2 of theDimensions) then
					scale to size theMaxSize
					
					-- Save the scaled image
					save
				end if
				
				-- Close the image
				close
				
			end tell
		end tell
	end repeat
end open