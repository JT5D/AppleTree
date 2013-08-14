#!/bin/bash
#
# keystroke.sh
#
# purpose:  Capture keystrokes of a user and log
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  08-Jan-2011
# modified: Sat 08 Jan 2011 02:16:09 PM EST
#
# obs: http://bashshell.net/shell-scripts/recording-user-activity-with-a-script/ 
#

# nice way to pass $0
cmd=$(basename $0 .sh)

# help section
help()
{
echo
echo "write help message here"
echo "usage: $cmd [options,flags,etc]"
echo
}

if [ "$1" == "--help" ] ; then
  echo
  help
  echo
  exit 0
fi

TIMESTAMP=$(date +%m%d%y%H%M%S)
HOST=$(hostname|cut -f1 -d.)
LOGDIR=/var/log/user
LOGFILE=${HOST}.${LOGNAME}.${TIMESTAMP}
touch $LOGDIR/$LOGFILE

# Set Prompt
export PS1=”[$LOGNAME:$HOST]@”‘$PWD> ‘

chown $LOGNAME ${LOGDIR}/${LOGFILE}
chmod 600 ${LOGDIR}/${LOGFILE}

script ${LOGDIR}/${LOGFILE}
chmod 400 ${LOGDIR}/${LOGFILE}
