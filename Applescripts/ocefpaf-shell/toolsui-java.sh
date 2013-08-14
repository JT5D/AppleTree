#!/bin/bash
 
# toolsui-java
#
# purpose:  
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     02-Jan-10
# modified: 02-Jan-10
#
# obs: 
#

# check dependencies
commds=( java )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

java -Xmx512m -jar /home/${USER}/svn-tools/mymatlab/toolsUI-4.1.jar > /dev/null 2>&1 &
