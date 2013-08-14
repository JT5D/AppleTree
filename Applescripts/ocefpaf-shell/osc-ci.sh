#!/bin/bash
 
# osc-ci
#
# purpose:  add/remove/commit
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     22-Dec-09
# modified: Sun 16 Jan 2011 11:33:44 AM EST
#
# obs: OpenSuse Build Service osc
#

# check dependencies
commds=( osc )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

osc addremove
#osc ci
osc ci -m "auto commit"
