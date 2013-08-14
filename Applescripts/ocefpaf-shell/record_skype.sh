#!/bin/bash
#
# record_skype.sh
#
# purpose:  Record a window using ffmpeg
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  04-Jul-2012
# modified: Sun 29 Jul 2012 09:16:45 AM BRT
#
# obs:
#

file=$(mktemp --tmpdir=$(pwd) --dry-run --suffix=.avi)
size=900x700
pos=230,60

set -x
echo "Geometry: ${geom}"
echo "pos=$pos size=$size"
ffmpeg -f alsa \
       -ac 2 \
       -i hw:0,0 \
       -f x11grab \
       -r 30 \
       -s ${size} \
       -i :0.0+${pos} \
       -an \
       -threads 0 \
       -sameq \
       -y $file

# -vcodec libx264 \
# -acodec pcm_s16le \
#        -vpre lossless_ultrafast \
