#!/bin/bash
 
# netinfo
#
# purpose:  acquire net information
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     28-Feb-09
# modified: 24-Nov-09
#
# obs: smart use of whatismyip
# source: http://www.novell.com/coolsolutions/tools/downloads/bashrc.txt
#

# check dependencies
commds=( /sbin/ifconfig )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

echo "--------------- Network Information ---------------"
echo "my ip:$(curl ifconfig.me/ip)"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
/sbin/ifconfig | awk /'Bcast/ {print $3}'
/sbin/ifconfig | awk /'inet addr/ {print $4}'
/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
