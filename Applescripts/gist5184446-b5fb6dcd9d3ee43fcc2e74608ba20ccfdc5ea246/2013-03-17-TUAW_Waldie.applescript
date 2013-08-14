-- This property controls the calendar on which the event is added
set theCalendarName to "AppleScripts"

-- Prompt the user to select a script to attach to an event.  This should be an application.
set theScriptToTrigger to choose file with prompt "Please select a saved AppleScript application to attach to an event:" of type "app"

-- Get the script's name
set theScriptToTriggerName to displayed name of (info for theScriptToTrigger)

-- Check for the existence of the target calendar, creating it if it doesn't already exist
tell application "Calendar"
  if (calendar theCalendarName exists) = false then
		make new calendar with properties {name:theCalendarName}
	end if
	
	-- Get the current date and time
	set theCurrentDate to current date
	
	-- Create a new event at the current date and time
	set theEvent to make new event at end of calendar theCalendarName with properties {summary:"AppleScript Trigger: " & theScriptToTriggerName, start date:theCurrentDate, end date:theCurrentDate}
	
	-- Add an open file alarm to the newly created event and set it to open the selected script app
	make new open file alarm at theEvent with properties {trigger interval:0, filepath:POSIX path of theScriptToTrigger}
end tell