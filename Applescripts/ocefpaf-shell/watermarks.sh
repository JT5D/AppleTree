#!/bin/bash

# watermarks
#
# purpose:  Creates a watermark in a figure
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     12-Jun-09
# modified: 24-Nov-09
#
# obs: overwrites the original, this version is OK for single picture
#      for bacth watermark use the 'watermark' version!
#
#      watermark and figure size reduction are hardcoded
#      reduces image quality and size, check best options...
#
# source: http://duane-pwns.blogspot.com/2008/09/batch-watermarking-photos-in-bash.html
#

# check dependencies
commds=( convert composite mogrify )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

# input check
if [ $# -gt 0 ]; then
  text=$1          # watermark
  pics=(${@:2:$#}) # images
else                               
  echo "________________________________________________________________"
  echo                                                                   
  echo "error in $0"               
  echo
  echo "usage: $(basename $0) http://juefi.tiddlyspot.com/ figures"
  echo "________________________________________________________________"
  exit 1
fi

# create temp files
stamp_mask=$(mktemp --dry-run).png
stamp_fgnd=$(mktemp --dry-run).png
     stamp=$(mktemp --dry-run).png

convert -size 300x50 xc:grey30 -pointsize 20 -gravity center \
         -draw "fill grey70  text 0,0  '$text'" \
         ${stamp_fgnd} # foreground
convert -size 300x50 xc:black -pointsize 20 -gravity center \
         -draw "fill white  text  1,1  '$text'  \
                            text  0,0  '$text'  \
                fill black  text -1,-1 '$text'" \
         +matte ${stamp_mask} # mask
composite -compose CopyOpacity  ${stamp_mask}  ${stamp_fgnd} ${stamp} # blend foreground+mask
mogrify -trim +repage ${stamp} # trim figure

# reduce image size and quality to internet

for pic in ${pics[@]}; do
  # convert images to pdf
       ext=${pic##*.}
  filename=${pic%.*}
      file=${filename}_w.$ext
  convert -quality 60 ${pic} $file #   mogrify -resize 550x550 -quality 70 "$pic"
  composite -gravity SouthEast ${stamp} $file $file # apply the stamp
done

# remove temp files
rm -rf ${stamp_fgnd} ${stamp_mask} ${stamp}