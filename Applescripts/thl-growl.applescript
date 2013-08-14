set GrowlApp to "The Hit List Reminder"
set GrowlNotice to "Task"
set GrowlIconApp to "The Hit List"

tell application "GrowlHelperApp"
	register as application GrowlApp all notifications [GrowlNotice] default notifications [GrowlNotice] icon of application GrowlIconApp
end tell

tell application "The Hit List"
	set currentDate to current date
	set {currentDate's hours, currentDate's minutes, currentDate's seconds} to {0, 0, 0}
	repeat with this_task in (every task of today list)
		if not (completed of this_task) and not (canceled of this_task) then
			set taskDate to due date of this_task
			if taskDate is "missing value" then
				set taskDate to currentDate
			end if
			
			if taskDate < currentDate then
				set overdue to true
			else
				set overdue to false
			end if
			
			set taskID to "thl" & (id of this_task)
			set taskTitle to title of this_task
			
			try
				set taskDate to date string of taskDate
				set duedate to true
			on error the error_message number the error_number
				set taskDate to "No Date"
				set duedate to false
			end try
			
			if overdue then
				set taskPriority to 1
			else if duedate then
				set taskPriority to 0
			else
				set taskPriority to -1
			end if
			
			tell application "GrowlHelperApp"
				notify with name GrowlNotice title taskDate description taskTitle application name GrowlApp identifier taskID priority taskPriority with sticky
			end tell
		end if
	end repeat
end tell