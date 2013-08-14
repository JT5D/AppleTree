-- script to set iChat status based on current wireless network
-- written/tested on OSX 10.6.6 with iChat 5.0.3

-- inspired by: http://hints.macworld.com/article.php?story=2004041213242778

-- To use:
-- 1. Modify the locale examples as desired; make sure to update localeTable if you add/remove any.
-- 2. Modify the defaultStatus if desired.  The string "#SSID" will be replaced with the name of the wireless network.
-- 3. In iChat -> Preferences, go to Alerts.  Under "When I Log In", check "Run an AppleScript script" and choose this script.

property work : {ssid:"Initech Internal", statusMessage:"in the office"}
property home : {ssid:"linksys", statusMessage:"working from home"}
property coffeeshop : {ssid:"My Local Coffeeshop", statusMessage:"at the coffee shop"}
property localeTable : {work, home, coffeeshop}

-- Fallback message to be used if none of the above locations match.  Use an empty string to leave status as "Available".
property defaultStatus : "online from #SSID"

on getSSID()
	set ssid to do shell script "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I|grep \" SSID:\" | cut -c 18-"
	return ssid
end getSSID

on replace(sourceText, oldText, newText)
	set {atid, AppleScript's text item delimiters} to {AppleScript's text item delimiters, oldText}
	set tempText to text items of sourceText
	set AppleScript's text item delimiters to newText
	set sourceText to tempText as string
	set AppleScript's text item delimiters to atid
	return sourceText
end replace

using terms from application "iChat"
	on login finished
		
		set ssid to my getSSID()
		
		if ssid is "" then
			return false
		end if
		
		set newStatus to replace(defaultStatus, "#SSID", ssid)
		
		repeat with locale in localeTable
			if ssid of locale is ssid then
				set newStatus to statusMessage of locale
			end if
		end repeat
		
		if newStatus is not "" then
			set status message to newStatus
			return true
		end if
		
	end login finished
end using terms from
