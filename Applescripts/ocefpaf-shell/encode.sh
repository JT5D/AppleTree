#!/bin/bash
 
# encode
#
# purpose:  tar-dir + gpg
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
  dir=$1
 file=$(basename $dir).tar
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) encode dir"
  echo "________________________________________________________________"
  exit 1
fi

tar cvf $file $dir
gpg --verbose --symmetric $file
wipe -ZdntVAkOr -S512 -C4096 -l1 -x8 -p1 $dir
wipe -ZdntVAkOr -S512 -C4096 -l1 -x8 -p1 $file