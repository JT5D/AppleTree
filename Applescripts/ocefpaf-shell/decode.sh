#!/bin/bash
 
# decode
#
# purpose:  decode files from encode
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     04-Jan-10
# modified: 04-Jan-10
#
# obs: 
#

# check dependencies
commds=( tar gpg wipe )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

# input check
if [ $# -eq 1 ]; then
  file=$1
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) filename.gpg"
  echo "________________________________________________________________"
  exit 1
fi

gpg $file
tar xvf $(basename $file gpg)
# rm -rf $file