#!/bin/bash

# loggedin
#
# purpose:
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     07-Aug-10
# modified: 07-Aug-10
#
# obs: http://www.thegeekstuff.com/2010/07/3-shell-scripts/?utm_source=feedburner&utm_medium=email&utm_campaign=Feed%3A+TheGeekStuff+%28The+Geek+Stuff%29
#

tmp=$(mktemp)
w > $tmp

echo "Total number of unique users logged in currently"
cat $tmp |  sed '1,2d' | awk '{print $1}' | uniq | wc -l
echo

echo "List of unique users logged in currently"
cat $tmp | sed '1,2d'|  awk '{print $1}' | uniq
echo

echo "The user who is using high %cpu"
cat $tmp | sed '1,2d' | awk   '$7 > maxuid { maxuid=$7; maxline=$0 }; END { print maxuid, maxline }'

echo
echo "List of users logged in and what they are doing"
cat $tmp