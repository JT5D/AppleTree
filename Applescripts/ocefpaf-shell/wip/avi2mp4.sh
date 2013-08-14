#!/bin/bash

# 
# avi2mp4
#
# purpose:  convert AVI to MP4
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     13-Aug-09
# modified: 13-Aug-09
#
# obs: need ffmpeg
#

if [[ -z $( type -p ffmpeg ) ]]; then echo -e "ffmpeg -- NOT INSTALLED !";exit 1 ;fi

# number of files
  N_FILES=$( ls *.avi  |wc|awk '{print $1}')

# infile
  ls *.avi > list.txt
for ((  i = 1 ;  i <= $N_FILES ; i++  ))
   do
   CURRENT_VID=$( cat list.txt |awk '{print $1}' |head -n $i|tail -n 1)
   ffmpeg -i $CURRENT_VID -vcodec libx264 -b 2000 -acodec libmp3lame $CURRENT_VID.mp4
done
