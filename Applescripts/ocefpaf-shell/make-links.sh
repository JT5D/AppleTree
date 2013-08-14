#!/bin/bash
#
# make-links.sh
#
# purpose:  create links for all scripts in this folder @ ~/bin
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  12-Oct-2009
# modified: Wed 06 Feb 2013 10:25:18 AM BRST
#
# obs:
#

# Remove dangling links first.
sh rmlinks.sh $HOME/bin/

# create links
for progs in *.sh; do
    prog=$(basename ${progs} .sh)
     src=$(pwd)/${progs}
     bin=$HOME/bin/${prog}
    if [ -e "$bin" ]; then
        echo "${prog} exists"
        continue 
    else
        ln -s $src $bin
        echo "${prog} created"
    fi
done
