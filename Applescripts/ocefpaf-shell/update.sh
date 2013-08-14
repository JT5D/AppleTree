#!/bin/bash
#
# update.sh
#
# purpose:  update system with zypper dup +svn repos via external scripts
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  17-Mar-2009
# modified: Sun 29 Aug 2010 06:16:01 PM EDT
#
# obs:
#

# check dependencies
commds=( svn zypper )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

# nice way to pass $0
cmd=$(basename $0 .sh)

# help section
help()
{
  echo "update system with zypper dup +svn repos via external scripts"
  echo
  echo "Use:"
  echo "  $cmd [options]"
  echo
  echo "Options:"
  echo "  $cmd                    -> update system only "
  echo "  $cmd -hdd call bkp-home -> perform system bkp at external HDD"
  echo "  $cmd -em call bkp-email -> save email and docs at CRUZER"
  echo "  $cmd -ck call version_control_check    -> update and commit svn repos"
  echo "  $cmd -up call version_control_update -> update svn repos"
  echo
  echo "Examples:"
  echo "  $cmd -hdd -em -ck -up"
  echo "  $cmd -ck -up"
  echo "  $cmd -up"
  echo
  exit 0
}

if [ "$1" == "--help" ] ; then
  echo
  help
  echo
  exit 0
fi

kdialog --passivepopup "type the root password, if you haven't already..." 5
sudo zypper refresh

kdialog --passivepopup "refreshing repositories and updatating..." 5
sudo zypper dup

while [ $# -gt 0 ] ; do
  case "$1" in
    -hdd) echo; kdialog --passivepopup " calling bkp-home  " 5; echo; bkp-home  toshiba ;;
     -ju) echo; kdialog --passivepopup " calling bkp-home  " 5; echo; bkp-home  ju ;;
     -em) echo; kdialog --passivepopup " calling bkp-email " 5; echo; bkp-email    ;;
     -ck) echo; kdialog --passivepopup " calling version_control_check    " 5; echo; version_control_check       ;;
     -up) echo; kdialog --passivepopup " calling version_control_update    " 5; echo; version_control_update       ;;
       *) echo "Invalid command"
          help
          exit 1
  esac
  shift
done
