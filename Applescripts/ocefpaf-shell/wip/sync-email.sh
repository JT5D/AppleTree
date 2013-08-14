#!/bin/bash
 
# sync-email
#
# purpose:  sync emails at CRUZER thumbdrive
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     27-Mar-09
# modified: 24-Nov-09
#
# obs: CRUZER mounted at /media/cruzer
# source: http://ninetynine.be/blog/2009/03/ubuntu-backup-to-usb-drive-on-mount/
#

# check dependencies
commds=( kdialog )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

user=filipe

{
mount_point=$(grep cruzer /etc/mtab)
attempts=1
while [ -z "$mount_point" ] && [ "$attempts" -le 50 ]; do
    # if $mount_point has not been found quit if this fails more than 50 times. 
    # This should not be necessary, but it better to be safe than have the script
    # trapped in this loop forever for some unforeseen reason.
    sleep 1
    mount_point=$(grep cruzer /etc/mtab)
    attempts=$(($attempts+1))
done
 
if [ -n "$mount_point" ]; then
 set -x; xhost local:${user}; export DISPLAY=:0.0 # prepare x session
 kdialog --yesno "backup data?"
 if [ $? == "0" ]; then
   su ${user} -c 'kdialog --passivepopup "backuping ~/Docments in /media/cruzer" 10'
   rsync -a --delete /home/${user}/Documents  /media/cruzer
   rsync -a --delete /home/${user}/.thunderbird/cknn663n.default/Mail /media/cruzer/PortableApps/ThunderbirdPortableTest/Data/profile
   su ${user} -c 'kdialog --passivepopup "DONE" 2'
 else
   echo exiting
   exit 0
 fi
fi
} &