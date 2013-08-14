#!/bin/bash

# watermark
# purpose: add watermark to photos
# author: Filipe P. A. Fernandes
# e-mail: ocefpaf@gmail.com
# web:    http://ocefpaf.tiddlyspot.com/
# date:   17-Mar-09
#
# obs: Creates a new directory in the working directory. Copies all JPEG files into the new directory
#      Resizes and compresses all the copied images. Adds a watermark to all the compressed images
# source: http://duane-pwns.blogspot.com/2008/09/batch-watermarking-photos-in-bash.html
#
# Though it can easily be changed, the hardcoded values
# for image size and compression are 550x550 px max and
# 50% JPEG compression (at the loss of quality)

watermark='stamp.png' # watermark used

if [ ! -e "$watermark" ]; then
  echo $watermark does not exists, to create a watermark:
  echo '
        text="Ju&Fi"
        convert -size 300x50 xc:grey30 -pointsize 20 -gravity center \
                -draw "fill grey70  text 0,0  $text" stamp_fgnd.png
        convert -size 300x50 xc:black -pointsize 20 -gravity center \
                -draw "fill white  text  1,1  $text text  0,0  $text  \
                        fill black  text -1,-1 $text" +matte stamp_mask.png
        composite -compose CopyOpacity stamp_mask.png stamp_fgnd.png stamp.png
        mogrify -trim +repage stamp.png
        rm -rf stamp_mask.png stamp_fgnd.png'
  exit 1
fi

dirname=$PWD/watermark # project dir
mkdir $dirname         # make project dir
cp *.jpg $dirname      # copy images to new directory
cd $dirname            # change to work dir

# count number of files to process
current=0
 numpix=$(ls | grep -ic jpg)

# modify the images
for pic in *.jpg; do
    let "current += 1"
    percent=$[100*$current/$numpix]
    echo "[ $percent% ] compressing $pic"
    mogrify -resize 550x550 -quality 70 "$pic"
    echo "[ $percent% ] Adding $watermark to $pic"
    composite -gravity SouthEast $watermark "$pic" "$pic"
done