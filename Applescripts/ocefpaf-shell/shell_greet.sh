#!/bin/bash
#
# shell_greet.sh
#
# purpose:
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  15-Mar-2011
# modified: Thu 13 Sep 2012 08:56:30 AM BRT
#
# obs:
#

hname=$(hostname)
echo "Welcome on $hname."

echo -e "Kernel Details: " `uname -smr`
echo -e "`bash --version`"
echo -ne "Uptime: "; uptime
echo -ne "Server time : "; date


#lastlog | grep "$USER" | awk {'print "Last login from : "$2
#print "Last Login Date & Time: ",$3,$4,$5,$6,$7,$8;}'
