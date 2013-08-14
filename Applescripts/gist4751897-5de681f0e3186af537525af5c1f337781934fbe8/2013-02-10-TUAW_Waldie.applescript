-- Ask the user to enter a date.  Note, if no time is specified, then the date will default to 12:00 AM.
set theDate to text returned of (display dialog "Please enter a starting date:" default answer "8/9/1997 12:00PM" with icon note with title "Elapsed Time Calculator")

-- Coerce the entered date to an AppleScript date
set theDate to date theDate

-- Get the current date
set theCurrentDate to current date

-- Determine the number of months, years, seconds, minutes, hours, days, and weeks
set theMonths to ((year of (theCurrentDate + 1 * days)) - (year of (theDate + 1 * days)) as integer) * 12 - ((month of (theDate + 1 * days)) - (month of (theCurrentDate + 1 * days)) as integer)
if (day of (theCurrentDate + 1 * days)) is not equal to (day of (theDate + 1 * days)) then
  if (day of (theCurrentDate + 1 * days)) is less than (day of (theDate + 1 * days)) then set theMonths to theMonths - 1
end if
set theYears to theMonths / 12
set theSeconds to theCurrentDate - theDate
set theMinutes to theSeconds / minutes
set theHours to theSeconds / hours
set theDays to theSeconds / days
set theWeeks to theSeconds / weeks

-- Add commas to the calculations, and append suffixes
set theMonths to comma_delimit(theMonths) & " Months"
set theYears to comma_delimit(theYears) & " Years"
set theSeconds to comma_delimit(theSeconds) & " Seconds"
set theMinutes to comma_delimit(theMinutes) & " Minutes"
set theHours to comma_delimit(theHours) & " Hours"
set theDays to comma_delimit(theDays) & " Days"
set theWeeks to comma_delimit(theWeeks) & " Weeks"

-- Create the message to be displayed
set theMessage to ("Happy Valentine's Day!" & return & return & "You have been together for…" & return & return & theYears & ", or…" & return & theMonths & ", or…" & return & theWeeks & ", or…" & return & theDays & ", or…" & return & theHours & ", or…" & return & theMinutes & ", or…" & return & theSeconds & return & return & "Congratulations! That's quite an accomplishment.")

-- Display the message
display dialog theMessage with icon (path to resource "FavoriteItemsIcon.icns" in bundle ((path to "csrv" as string) & "CoreTypes.bundle" as alias)) buttons {"OK"} default button "OK" with title "Elapsed Time Calculator"

on number_to_string(this_number)
	set this_number to this_number as string
	if this_number contains "E+" then
		set x to the offset of "." in this_number
		set y to the offset of "+" in this_number
		set z to the offset of "E" in this_number
		set the decimal_adjust to characters (y - (length of this_number)) thru ¬
			-1 of this_number as string as number
		if x is not 0 then
			set the first_part to characters 1 thru (x - 1) of this_number as string
		else
			set the first_part to ""
		end if
		set the second_part to characters (x + 1) thru (z - 1) of this_number as string
		set the converted_number to the first_part
		repeat with i from 1 to the decimal_adjust
			try
				set the converted_number to ¬
					the converted_number & character i of the second_part
			on error
				set the converted_number to the converted_number & "0"
			end try
		end repeat
		return the converted_number
	else
		return this_number
	end if
end number_to_string

on comma_delimit(this_number)
	set this_number to round_truncate(this_number, 1)
	set this_number to this_number as string
	if this_number contains "E" then set this_number to number_to_string(this_number)
	set this_suffix to ""
	if this_number contains "." then
		set this_suffix to text (offset of "." in this_number) thru -1 of this_number
		if this_number = this_suffix then
			set this_number to ""
		else
			set this_number to text 1 thru ((offset of "." in this_number) - 1) of this_number
		end if
	end if
	set the num_length to the length of this_number
	set the this_number to (the reverse of every character of this_number) as string
	set the new_num to ""
	repeat with i from 1 to the num_length
		if i is the num_length or (i mod 3) is not 0 then
			set the new_num to (character i of this_number & the new_num) as string
		else
			set the new_num to ("," & character i of this_number & the new_num) as string
		end if
	end repeat
	if this_suffix = ".0" then return new_num
	return the new_num & this_suffix
end comma_delimit

on round_truncate(this_number, decimal_places)
	if decimal_places is 0 then
		set this_number to this_number + 0.5
		return number_to_string(this_number div 1)
	end if
	
	set the rounding_value to "5"
	repeat decimal_places times
		set the rounding_value to "0" & the rounding_value
	end repeat
	set the rounding_value to ("." & the rounding_value) as number
	
	set this_number to this_number + rounding_value
	
	set the mod_value to "1"
	repeat decimal_places - 1 times
		set the mod_value to "0" & the mod_value
	end repeat
	set the mod_value to ("." & the mod_value) as number
	
	set second_part to (this_number mod 1) div the mod_value
	if the length of (the second_part as text) is less than the decimal_places then
		repeat decimal_places - (the length of (the second_part as text)) times
			set second_part to ("0" & second_part) as string
		end repeat
	end if
	
	set first_part to this_number div 1
	set first_part to number_to_string(first_part)
	set this_number to (first_part & "." & second_part)
	
	return this_number
end round_truncate