find . -name "*.jpg" --or -name "*.png" |zenity --list --column "Pictures" --height 400 --width 400

h | cut -c 8-|zenity --list --column History

#/bin/bash
strFilePath=$(zenity --file-selection --file-filter "*.txt");
if [ $? = 1 ];
	then exit
fi
echo $strFilePath
kate $strFilePath

xmessage -display :0.0 "You are late"
