#!/bin/bash

# untar_split
#
# purpose:  multi-file uncompressed tar
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     01-Mar-09
# modified: 24-Nov-09
#
# obs: uses tar and cat together decompress
#

#input check
if [ $# -eq 3 ]; then
  input=$1
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "e.g.: $(basename $0) filename.tar.bz2."
  echo "________________________________________________________________"
  exit 1
fi

cat $input | split -d -b $size - $output