#!/bin/bash
#
# bkp-home.sh
#
# purpose:  Rotatory backup of the /home/$USER
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  28-Feb-2010
# modified: Thu 20 Jun 2013 01:48:53 PM BRT
#
# obs: add directories at SOURCES
#      add rotation at ROTATIONS
#      exclude file is created as a list dumped to tmpfile
#      get laptop at /etc/HOSTNAME via uname -n
#
#  source: http://www.linux.com/archive/feature/121604
#

function Err()
{
echo "ctrl-c"
echo "however the bkp will continue"
}
trap Err SIGINT SIGTERM
# kill -l to get a list

# Nice way to pass $0.
cmd=$(basename $0 .sh)

# Help section.
help()
{
echo
echo "perform bkp of the user home directory"
echo "usage: $cmd hard-disk-name (TOSHIBA/JU/SAT)"
echo
}

if [ "$1" == "--help" ] ; then
  echo
  help
  echo
  exit 0
fi

# Hard disk input.
if [ $# -eq 1 ]; then
  HDD=$1
else
  echo
  echo "error in $cmd"
  help
  echo
  exit 1
fi

case $HDD in
    TOSHIBA|Toshiba|toshiba)
        HDD="TOSHIBA"
        ;;
    JU|ju|Ju|jU)
        HDD="linux"
        ;;
    SAT|sat|Sat|SAt|SaT|sAT)
        HDD="SAT"
        ;;
    *)
        echo "HDD not found"
        exit 1 ;;
esac

kdialog --passivepopup "Always remember to back-it-up" 5

# User settings.
         LAP=$(basename $(uname -n) .site)
      TARGET="/media/${HDD}/${USER}-${LAP}/"
     SOURCES=$(echo /home/${USER})
   ROTATIONS=7
 BACKUP_DATE=$(date +%F_%H-%M)
EXCLUDE_FILE=$(mktemp --dry-run)

# Create exclude file.
echo "\
*.iso
*.vdi
*.vmdk
00-NOBKP
Downloads
Dropbox
lost+found\
" > $EXCLUDE_FILE

# rsync options.
options="-a --delete --cvs-exclude --verbose"
#--checksum really slow


if [ ! -x $TARGET ]; then
  echo "Backup target does not exist or you don't have permission!"
  echo "Exiting..."
  exit 2
fi

if [ ! $ROTATIONS -gt 1 ]; then
  echo "You must set ROTATIONS to a number greater than 1!"
  echo "Exiting..."
  exit 2
fi

# Begin rotation.
kdialog --passivepopup "starting bkp at $HDD" 10
BACKUP_NUMBER=1 # incrementor used to determine current number of backups

# List all backups in reverse (newest first) order, set name of oldest backup
# to $backup if the retention number has been reached.
for backup in `ls -dXr $TARGET/*/`; do
    if [ $BACKUP_NUMBER -eq 1 ]; then
        NEWEST_BACKUP="$backup"
    fi

    if [ $BACKUP_NUMBER -eq $ROTATIONS ]; then
        OLDEST_BACKUP="$backup"
        break
    fi

    let "BACKUP_NUMBER=$BACKUP_NUMBER+1"
done

# Check if $OLDEST_BACKUP has been found. If so, rotate. If not, create new directory for this backup.
if [ $OLDEST_BACKUP ]; then
  # Set oldest backup to current one
  mv $OLDEST_BACKUP $TARGET/$BACKUP_DATE
else
	mkdir $TARGET/$BACKUP_DATE
fi

# Update current backup using hard links from the most recent backup
if [ $NEWEST_BACKUP ]; then
  cp -al --force $NEWEST_BACKUP. $TARGET/$BACKUP_DATE
fi

# End rotation.

# Check to see if rotation section created backup destination directory
if [ ! -d $TARGET/$BACKUP_DATE ]; then
  echo "Backup destination not available. Make sure you have write permission in TARGET!"
  echo "Exiting..."
  exit 2
fi

echo "Verifying Sources..."
for source in $SOURCES; do
    echo "Checking $source..."
    if [ ! -x $source ]; then
     echo "Error with $source!"
     echo "Directory either does not exist, or you do not have proper permissions."
     exit 2
   fi
done

if [ -f $EXCLUDE_FILE ]; then
    EXCLUDE="--exclude-from=$EXCLUDE_FILE"
fi

echo "Sources verified. Running rsync..."

for source in $SOURCES; do
# Create directories in $TARGET to mimick source directory hiearchy
    if [ ! -d $TARGET/$BACKUP_DATE/$source ]; then
    mkdir -p $TARGET/$BACKUP_DATE/$source
    fi
    if [ $HDD == "SAT" ]; then
        rsync ${options} --exclude=$TARGET/ $source/ $TARGET/$BACKUP_DATE/$source/ | tee ~/${BACKUP_DATE}.log
    else
        rsync ${options} --exclude=$TARGET/ $EXCLUDE $source/ $TARGET/$BACKUP_DATE/$source/ | tee ~/${BACKUP_DATE}.log
    fi

done

rm $EXCLUDE_FILE

kdialog --passivepopup "finished" 5
