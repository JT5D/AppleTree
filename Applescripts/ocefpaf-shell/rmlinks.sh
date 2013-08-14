#!/bin/bash
 
# rmlinks
#
# purpose:  remove broken symlinks
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     22-Dec-09
# modified: 22-Dec-09
#
# obs:  basic a copy of cleanlinks
#

# input check
if [ $# -eq 1 ]; then
  dir=$1
else
  dir=$PWD
fi

find $dir -xdev -type l -print |
(
        read i
        while [ X"$i" != X ]; do
                if [ ! -f "$i" ]; then
                        echo $i is a dangling symlink, removing
                        rm -f "$i"
                fi
                read i
        done
)
