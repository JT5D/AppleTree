#!/bin/bash
 
# compile
#
# purpose:  Compile shell script   
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     17-Mar-09
# modified: 24-Nov-09
#
# obs: just a wrapper for shc, a simple alias would do the trick too.
#

# check dependencies
commds=( shc )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

#input check
if [ $# -gt 0 ]; then
  shells="$@";
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) shell_script.sh"
  echo "________________________________________________________________"
  exit 1
fi

for shell in ${shells[@]}; do
  shc -r -v -f ${shell}
  done