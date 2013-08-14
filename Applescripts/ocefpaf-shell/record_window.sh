#!/bin/bash
#
# record_windows.sh
#
# purpose:  Record a window using ffmpeg
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  04-Jul-2012
# modified: Wed 04 Jul 2012 03:37:10 PM BRT
#
# obs:
#


tmpfile=/tmp/screengrab.tmp.$$
trap 'touch $tmpfile; rm -f $tmpfile' 0

xwininfo > $tmpfile 2>/dev/null
   top=$(grep 'Absolute upper-left Y:' $tmpfile | awk '{print $4}');
  left=$(grep 'Absolute upper-left X:' $tmpfile | awk '{print $4}');
 width=$(grep 'Width:' $tmpfile | awk '{print $2}');
height=$(grep 'Height:' $tmpfile | awk '{print $2}');

geom="-geometry ${width}x${height}+${left}+${top}"

rem=$(($width % 2 ))
if [ $rem -eq 0 ] ; then
  echo "$width is even number"
else
  width=$(($width + 1))
fi

rem=$(($height % 2 ))
if [ $rem -eq 0 ] ; then
  echo "$height is even number"
else
  height=$(($height + 1))
fi

rem=$(($left % 2 ))
if [ $rem -eq 0 ] ; then
  echo "$left is even number"
else
  left=$(($left + 1))
fi

rem=$(($top % 2 ))
if [ $rem -eq 0 ] ; then
  echo "$top is even number"
else
  topq=$(($top + 1))
fi

size="${width}x${height}"
pos="${left},${top}"

echo "Geometry: ${geom}"
echo "pos=$pos size=$size"
file=$(mktemp --tmpdir=$(pwd) --dry-run --suffix=.avi)
set -x
ffmpeg -f alsa \
       -ac 2 \
       -i hw:0,0 \
       -f x11grab \
       -r 15 \
       -s ${size} \
       -i :0.0+${pos} \
       -acodec pcm_s16le \
       -vcodec libx264 \
       -threads 0 \
       -sameq \
       -y $file
