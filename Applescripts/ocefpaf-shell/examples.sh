#!/bin/bash
 
# examples
#
# purpose:  show code snippets
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     04-Dec-09
# modified: Wed 06 Feb 2013 10:29:32 AM BRST
#
# obs: 
#

# check dependencies
commds=( kdialog )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

# input check
if [ $# -eq 1 ]; then
  example=$1
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) grep or $(basename $0) list"
  echo "________________________________________________________________"
  exit 1
fi

dir=${HOME}/Dropbox/REPOS/ocefpaf-shell/comandos/

if [ "$example" = "list" ]; then
    example=$(kdialog --getopenfilename $dir "*.cmd | examples")
    kdialog --textbox $example 750 900 &
else
#    kdialog --textbox ${dir}${example}.cmd 750 900 &
    cat ${dir}${example}.cmd
fi
