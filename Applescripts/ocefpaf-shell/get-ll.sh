#!/bin/bash
 
# get-ll
#
# purpose:  find lat,lon from adress
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     25-Dec-09
# modified: 25-Dec-09
#
# obs: uses yahoo api
# source: http://www.linuxjournal.com/article/10589

# check dependencies
commds=( curl )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

# input check
if [ $# -gt 1 ]; then
  addr="$(echo $* | sed 's/ /+/g')"
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) 706 South Rodney French Boulevard, New Bedford, MA"
  echo "________________________________________________________________"
  exit 1
fi

      url='http://api.maps.yahoo.com/ajax/geocode'
     args='?appid=onestep&qt=1&id=m&qs='
converter="$url$args"

latlong=$(curl -s "$converter$addr" |  cut -d\" -f13,15 | sed 's/[^0-9\.\,\-]//g;s/,$//')
lat=$(echo "$latlong" | cut -d ',' -f 1)
lon=$(echo "$latlong" | cut -d ',' -f 2)

echo $lat
echo $lon