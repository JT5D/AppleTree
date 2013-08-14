#!/bin/bash
 
# savestream
#
# purpose:  Reads a live stream and copies its contents to a file
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     30-Nov-09
# modified: 30-Nov-09
#
# obs: 
# source: http://smurfmatic.net/blog/archives/2007/11/04/saving-video-streams-with-mencoder-on-li.html

# check dependencies
commds=( mencoder )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

#input check
if [ $# -ne 3 ]; then
  STREAM_URL=${1}
    DURATION=${2}
  IDENTIFIER=${3}
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) [stream url] [duration] [identifier]"
  echo "________________________________________________________________"
  exit 1
fi

      NOW=$(date +%Y%m%d%H%M);
   FORMAT="asf"
EXTENSION="wmv"

mencoder -forceidx -oac copy -ovc copy -endpos ${DURATION} -vf harddup ${STREAM_URL} \
        -of lavf -lavfopts format=${FORMAT} -o ${IDENTIFIER}${NOW}.${EXTENSION}


##############################################################################
# Loop through the file
# for line in $(< lista.txt); do
#     out=$(basename $line)
#     mplayer -noframedrop -dumpfile $out -dumpstream $line
# done
##############################################################################
# purpose:  download streaming videos from asx url
# if [[ -z $( type -p mencoder ) ]]; then echo -e "Mplayer's mencoder -- NOT INSTALLED !"; exit 1; fi
# 
# if [ -n "$1" ] && [ -n "$2" ]; then
#   url=$1   # prefix of the frames
#   output=$2 # output video name
# else
#   echo "________________________________________________________________"
#   echo
#   echo "error in $0. No url to process nor output name"
#   echo "________________________________________________________________"
#   echo
#   echo "usage :  $0 url video.avi"
#   echo "________________________________________________________________"
#   exit 1
# fi
# 
# mencoder -oac copy -ovc copy $url -o $output