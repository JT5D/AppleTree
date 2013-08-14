# configure wine. Remember to check drives and windows version.
wincfg

# run notepad
wine notepad

# file manager
wine winfile

# open help file
wine winhelp

# open task manager
wine taskmgr

# uninstall programs
uninstaller

# temporary files at
~/.wine/drive_c/windows/temp/

# install msi
msiexec /i /home/gdh/msxml6.msi\

# fonts
.wine/drive_c/windows/Fonts/

# wine tricks
wget http://www.kegel.com/wine/winetricks

# NO CD patch
umount /media/cdrom
mount -o unhide /dev/cdrom /media/cdrom
