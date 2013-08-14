#!/bin/bash

# my-eject
#
# purpose:  Eject devices
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     14-Aug-10
# modified: Thu 20 Jun 2013 05:35:27 PM BRT
#
# obs:
#

# Help section.
cmd=$(basename $0) # get script name

if [ "$1" == "--help" ] ; then
  echo "Remove PenDrive"
  echo
  echo "usage: $cmd /media/Device"
  echo
  exit 0
fi

# Input check.
if [ $# -eq 1 ]; then
  PDname=$(basename $1)
else
  echo "________________________________________________________________"
  echo
  echo "error in $cmd"
  echo
  echo "type $cmd --help for info"
  echo "________________________________________________________________"
  exit 1
fi

command=udisks

# Force changed blocks to disk, update the super block.
sync
sleep 1
sync

PD=$(df | grep ${PDname} | awk '{print $1}')
echo "removing $PDname at $PD"
sudo $command --unmount ${PD}

sleep 2

if [ $? -ne 0 ]; then
  echo "$command --unmount ${PD} failed. Exiting..."
  exit 1
else
  PD=$(echo "$PD" | sed 's/[0-9]*//g')
  sudo $command --detach ${PD}
  if [ $? -ne 0 ]; then
    echo "$command --detach ${PD} failed. Exiting..."
  fi
fi
