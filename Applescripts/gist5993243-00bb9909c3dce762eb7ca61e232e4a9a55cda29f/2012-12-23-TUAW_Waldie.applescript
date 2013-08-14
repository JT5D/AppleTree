-- Set up some initial starting positions and offsets
property theRaceStartingLineTopPosition : 50
property theRaceStartingLineLeftPosition : 100
property theRaceStartingLineBottomOffset : 200
property theRaceFinishLineRightOffset : 200

-- Determine the screen size
tell application "Finder"
	set theDesktopBounds to bounds of window of desktop
	set theDesktopWidth to item 3 of theDesktopBounds
	set theDesktopHeight to item 4 of theDesktopBounds
	
	-- Retrieve a list of items on the desktop
	set theDesktopItems to every item of desktop
	
	-- Retrieve the original positions of items on the desktop, so they can be restored later
	set theDesktopItemPositions to desktop position of every item of desktop
	
	-- Retrieve the current icon view options for the Desktop, so they can be restored later
	tell icon view options of window of desktop
		set thePreviousArrangement to arrangement
		set theIconSize to icon size
		set theLabelSize to text size
		
		-- Disable arrangement of icons on the Desktop
		set arrangement to not arranged
	end tell
	
	-- Determine how far apart to separate each contestant
	set theContestantOffset to theIconSize / 2
	
	-- Adjust the desktop height so items don't fall off the screen
	set theDesktopHeight to ((theDesktopHeight - theRaceStartingLineBottomOffset) as integer)
	
	-- Determine the finish line location
	set theFinishLine to theDesktopWidth - theRaceFinishLineRightOffset
	
	-- Determine how many items are allowed in the race
	set theMaxContestants to ((theDesktopHeight / (theIconSize + theLabelSize + theContestantOffset)) as integer) - 1
	
	-- Pick the contestants and spectactors
	set theContestants to {}
	set theSpectators to {}
	if (count of theDesktopItems) is less than or equal to theMaxContestants then
		set theContestants to theDesktopItems
	else
		set theContestants to items 1 thru theMaxContestants of theDesktopItems
		if (count of theDesktopItems) is greater than theMaxContestants then
			set theSpectators to items (theMaxContestants + 1) thru -1 of theDesktopItems
		end if
	end if
	
	-- Line up the contestants at the starting line
	set theCurrentBounds to {theRaceStartingLineLeftPosition, theRaceStartingLineTopPosition}
	set theOffset to theDesktopHeight / (count theContestants) as integer
	repeat with a from 1 to length of theContestants
		set desktop position of item a of theContestants to theCurrentBounds
		set item 2 of theCurrentBounds to ((item 2 of theCurrentBounds) + theOffset + theContestantOffset)
	end repeat
	
	-- Line up the spectators at the finish line
	set theCurrentBounds to {theFinishLine + (theRaceFinishLineRightOffset / 2), theRaceStartingLineTopPosition}
	if theSpectators is not equal to {} then
		set theSpectatorOffset to theDesktopHeight / (count theSpectators) as integer
		repeat with a from 1 to length of theSpectators
			set desktop position of item a of theSpectators to theCurrentBounds
			set item 2 of theCurrentBounds to ((item 2 of theCurrentBounds) + theSpectatorOffset)
		end repeat
	end if
	
	-- Prepare to start the race
	display dialog "3" buttons {"On Your Mark"} default button 1 with icon stop giving up after 1
	say "On Your Mark"
	display dialog "2" buttons {"Get Set"} default button 1 with icon caution giving up after 1
	say "Get Set"
	display dialog "1" buttons {"Go!"} default button 1 with icon note giving up after 1
	say "GO!"
	
	-- Randomly race across the desktop
	repeat
		set theCurrentItem to some item of theContestants
		set theCurrentItemPosition to desktop position of theCurrentItem
		set item 1 of theCurrentItemPosition to (item 1 of theCurrentItemPosition) + 10
		set desktop position of theCurrentItem to theCurrentItemPosition
		if item 1 of theCurrentItemPosition is greater than or equal to theFinishLine then
			set theWinner to name of theCurrentItem
			exit repeat
		end if
	end repeat
	
	-- Announce the winner
	beep 3
	display alert "DESKTOP RACE WINNER!" message "The item \"" & theWinner & "\" was the winner!" giving up after 10
	
	-- Reset the positions of the icons
	repeat with a from 1 to length of theDesktopItems
		try
			set desktop position of item a of theDesktopItems to item a of theDesktopItemPositions
		end try
	end repeat
	
	-- Reset the arrangement of the desktop
	tell icon view options of window of desktop
		set arrangement to thePreviousArrangement
	end tell
end tell