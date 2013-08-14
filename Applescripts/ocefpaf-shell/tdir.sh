#!/bin/bash
 
# tdir
#
# purpose:  compress a directory with tar bzip2
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     02-Jan-10
# modified: 02-Jan-10
#
# obs: compressed filename is the same as the directory
#

# check dependencies
commds=( lzma tar )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

# input check
if [ $# -eq 1 ]; then
  dir=$1
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) dir"
  echo "________________________________________________________________"
  exit 1
fi

tar cJvf $(basename $dir).tar.lzma $dir
