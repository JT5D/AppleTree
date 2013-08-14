#!/bin/bash

# mem
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

# Total memory space details
echo "Memory Space Details"
free -t -m | grep "Total" | awk '{ print "Total Memory space : "$2 " MB";
print "Used Memory Space : "$3" MB";
print "Free Memory : "$4" MB";
}'

echo "Swap memory Details"
free -t -m | grep "Swap" | awk '{ print "Total Swap space : "$2 " MB";
print "Used Swap Space : "$3" MB";
print "Free Swap : "$4" MB";
}'