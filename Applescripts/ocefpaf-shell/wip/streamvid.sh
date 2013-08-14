#!/bin/bash

# 
# streamvid
#
# purpose:  download streaming videos from asx url
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     20-Jul-09
# modified: 20-Jul-09
#
# obs: 
#

if [[ -z $( type -p mencoder ) ]]; then echo -e "Mplayer's mencoder -- NOT INSTALLED !"; exit 1; fi

if [ -n "$1" ] && [ -n "$2" ]; then
  url=$1   # prefix of the frames
  output=$2 # output video name
else
  echo "________________________________________________________________"
  echo
  echo "error in $0. No url to process nor output name"
  echo "________________________________________________________________"
  echo
  echo "usage :  $0 url video.avi"
  echo "________________________________________________________________"
  exit 1
fi

mencoder -oac copy -ovc copy $url -o $output