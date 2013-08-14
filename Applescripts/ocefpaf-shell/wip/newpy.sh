#!/bin/bash

# newpy
#
# purpose:  create a new python script
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     15-Mar-09
# modified: 17-Dec-09
#
# obs: no function nor class yet
#

#input check
if [ $# -eq 1 ]; then
  filename=$1
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) file.py"
  echo "________________________________________________________________"
  exit 1
fi

if [ -e "$filename" ]; then
  echo
  echo "$filename exists"
  echo
  exit 1
fi


# header info
today=$(date +%d-%b-%Y)
autor="Filipe P. A. Fernandes"
email="ocefpaf@gmail.com"
 base=$(basename $filename .py)
  web="http://ocefpaf.tiddlyspot.com/"

# make header
echo "#!/usr/bin/env python
# -*- coding: utf-8 -*-

#! $filename
#! ========================================
#! author:   $autor
#! e-mail:   $email
#! web:      $web
#! date:     $today
#! modified: $today
#! obs:
" >> $filename
