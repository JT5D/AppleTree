#!/bin/bash

# define.wiki
#
# purpose:  Check a term on wikipedia
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     08-May-10
# modified: 08-May-10
#
# obs: https://dgl.cx/2008/11/wpdns-pres/
#

# check dependencies
commds=( dig )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

# help section
cmd=$(basename $0) # get script name

if [ "$1" == "--help" ] ; then
  echo " define.wiki keyword"
  echo
  echo "usage: $cmd keyword "
  echo
  exit 0
fi

# input check
if [ $# -eq 1 ]; then
  keyword=$1
else
  echo "________________________________________________________________"
  echo
  echo "error in $cmd"
  echo
  echo "type $cmd --help for info"
  echo "________________________________________________________________"
  exit 1
fi


dig +short txt ${keyword}.wp.dg.cx