#!/bin/bash

# weather
#
# purpose:  get weather by usa zip code or city name
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     28-Feb-09
# modified: 24-Nov-09
#
# obs: weather 02744 or weather "New Bedford"
# source: http://www.novell.com/coolsolutions/tools/18639.html
#

# check dependencies
commds=( lynx )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

#input check
if [ $# -eq 1 ]; then
  zip=$1
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) 02744 \"New Bedford\""
  echo "________________________________________________________________"
  exit 1
fi

WEATHERARRAY=( `lynx -dump "http://www.google.com/search?hl=en&lr=&client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&q=weather+${zip}&btnG=Search" | grep -A 5 -m 1 "Weather for"`)

echo ${WEATHERARRAY[@]}