#!/bin/bash

# thes
#
# purpose:  Command line thesaurus
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     05-Jul-10
# modified: 05-Jul-10
#
# obs:      http://thesaurus.reference.com/search
#

# check dependencies
commds=( lynx html2text )
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
  echo "usage: $(basename $0) word"
  echo "________________________________________________________________"
  exit 1
fi



  BROWSER="/usr/bin/lynx -source"
  WEBSITE="http://thesaurus.reference.com/search?q=$1"
HTML2TEXT="/usr/bin/html2text -style compact"

if test $1; then
    ${BROWSER} ${WEBSITE} | ${HTML2TEXT} | ${PAGER}
else
    echo "Usage: $0 word"
    exit 1
fi