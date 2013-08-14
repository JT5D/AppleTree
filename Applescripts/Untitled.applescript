----	Created by: James Tunick--	Created on: 08/30/12 22:01:51----	Copyright (c) 2012 StudioIMC--	All Rights Reserved--	

set picsExt to {".jpg", ".gif", ".tif", ".png", ".psd"}
set picsFolder to (path to pictures folder)

set allFiles to files of this folder
	
	repeat with theFile in allFiles			copy name of theFile as string to FileName						repeat with ext in musicExt				if FileName ends with ext then					move theFile to musicFolder				end if			end repeat								end repeat	