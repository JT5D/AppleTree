#!/bin/bash

# tar_split
#
# purpose:  multi-file compressed tar
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     01-Mar-09
# modified: 24-Nov-09
#
# obs: uses tar and split together to build several multi-volumes(files)
#

#input check
if [ $# -eq 3 ]; then
  output=$1
   input=$2
    size=$3
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "e.g.: $(basename $0) filename.tar.bz2. bkp_dir 1024m"
  echo "________________________________________________________________"
  exit 1
fi

tar cjvf - ${input} | split -d -b $size - $output