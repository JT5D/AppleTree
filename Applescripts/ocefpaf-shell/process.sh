#!/bin/bash

# process
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

#List processes based on %cpu and memory usage
echo "Start Time" $(date)

# By default, it display the list of processes based on the cpu and memory usage #
if [ $# -eq 0 ]
then

        echo "List of processes based on the %cpu Usage"
        ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu  # sorted based on %cpu
        echo "List of processes based on the memory Usage"
        ps -e -orss=,args= | sort -b -k1,1n # sorted bases rss value

# If arguements are given (mem/cpu)
else
        case "$1" in
        mem)
         echo "List of processes based on the memory Usage"
         ps -e -orss=,args= | sort -b -k1,1n
         ;;
        cpu)
         echo "List of processes based on the %cpu Usage"
         ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu
         ;;
        *)
                echo "Invalid Argument Given \n"
                echo "Usage : $0 mem/cpu"
                exit 1
        esac

fi

echo "End Time" $(date)
exit 0