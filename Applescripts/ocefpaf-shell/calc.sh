#!/bin/bash
 
# calc
#
# purpose:  Floating Point Math at the Shell
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     15-Feb-09
# modified: 24-Nov-09
#
# obs: 4 decimal points
# source: http://www.dicas-l.com.br/dicas-l/20030729.php
#

# check dependencies
commds=( bc )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

#input check
if [ $# -eq 1 ]; then
  conta=$1
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) 2.5*3.1"
  echo "________________________________________________________________"
  exit 1
fi

echo "scale=4; ${conta}" | bc