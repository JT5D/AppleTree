#!/bin/bash
 
# fram2vid
#
# purpose:  make avi video from frames [JPGEGs, PNGs, TGAs]
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     21-Apr-09
# modified: 24-Nov-09
#
# obs: creates a file list then a 2-pass encoding
# source: http://personal.cscs.ch/~mvalle/mencoder/mencoder.html 
#

# check dependencies
commds=( identify mencoder )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

if [ $# -eq 2 ]; then
    pref=$1 # prefix of the frames
  output=$2 # output video name
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) frame??? video.avi"
  echo "________________________________________________________________"
  exit 1
fi

#fs=25, fs=10 add these as options
fs=15

# all frames must have same dimension
for i in $pref*
do
  img=$i # one frame for identify
  break
done

fmt=`echo $img | cut -f2 -d'.'` # format (png,jpeg)

# build list
echo
echo 'Enter the type of sorting 1 or 2 and press [ENTER]:

Type 1) for frames sorted as 001-100
Type 2) for frames sorted as   1-100

CAVEAT if frames have more than 3 digits number
the code must be changed !!!'
read sort

list=`mktemp` # safe temporary file for list

if [ "$sort" = "1" ]; then
   for file in ${pref}*
   do echo $file >> $list; echo $file; done
else
   for file in ${pref}?.${fmt};   do echo $file >> $list; echo $file; done
   for file in ${pref}??.${fmt};  do echo $file >> $list; echo $file; done
   for file in ${pref}???.${fmt}; do echo $file >> $list; echo $file; done
fi

# read the image dimensions
 width=$(identify $img | awk '{print $3}' | awk -Fx '{print $1}')
height=$(identify $img | awk '{print $3}' | awk -Fx '{print $2}')

# compute the optimal bitrate 
# br = 50 * 25 * width * height / 256
# the 50 factor can vary between 40 and 60
  obr=`expr $width \* $height \* 50 \* 25 / 256`
  opt="vbitrate=$obr:mbd=2:keyint=132:vqblur=1.0:cmp=2:subcmp=2:dia=2:mv0:last_pred=3" # set the Microsoft MPEG4 V2 codec options
codec="msmpeg4v2"
  snd="-nosound"

# two-pass conversion
mencoder -ovc lavc -lavcopts vcodec=$codec:vpass=1:$opt -mf type=$fmt:w=$width:h=$height:fps=$fs $snd -o /dev/null mf://@$list
mencoder -ovc lavc -lavcopts vcodec=$codec:vpass=2:$opt -mf type=$fmt:w=$width:h=$height:fps=$fs $snd -o $output mf://@$list

# cleanup
rm -rf divx2pass.log ${list}