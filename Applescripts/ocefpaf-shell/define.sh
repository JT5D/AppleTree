#!/bin/bash
 
# define
#
# purpose:  Define a word
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     25-Jun-09
# modified: 24-Nov-09
#
# obs:  online dict://dict.org database
# source: http://www.cs.sunysb.edu/documentation/curl/index.html
#

# check dependencies
commds=( curl )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

if [ $# -eq 1 ]; then
  word=$1
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) word"
  echo "________________________________________________________________"
  exit 1
fi

curl dict://dict.org/d:${word}