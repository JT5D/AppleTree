#!/bin/bash

# photo-ll
#
# purpose:  Add lat,lon values to jpegs
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     25-Dec-09
# modified: Sat 30 Jun 2012 12:39:02 PM BRT
#
# obs: need get-ll.sh and convert all jpegs in the present directory
# http://www.linuxjournal.com/content/
# tech-tip-add-latitudelongitude-information-photos

# check dependencies
commds=( exiv2 )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

# Grabs latitude and longitude values from stdin and stores
# them in all JPGs in current directory.
# The two values have to be separated by a comma.
#
export IFS=","
read lat long

# If sign is negative, we have to change reference
latRef="N";
latSign=$(echo $lat | cut -c 1)
if [ "X$latSign" = "X-" ]
then  # Delete minus from beginning
  lat=$(echo $lat | sed s/^-//)
  latRef="S"
fi
lonRef="E";
lonSign=$(echo $long | cut -c 1)
if [ "X$lonSign" = "X-" ]
then
  long=$(echo $long | sed s/^-//)
  lonRef="W"
fi

# Calculate latitude/longitude degrees and minutes
latDeg=$( echo "scale=0; $lat/1" | bc )
latMin=$( echo "scale=2; m=($lat-$latDeg) *100/ 0.016666;scale=0;m/1" | bc )
lonDeg=$( echo "scale=0; $long/1" | bc )
lonMin=$( echo "scale=2; m=($long-$lonDeg)*100/0.016666;scale=0;m/1" | bc )

echo Picture location will be: $latDeg $latMin\' $latRef , $lonDeg $lonMin\' $lonRef

for fil in *.jpg  # Also try *.JPG
do
  echo Updating $fil ....
  exiv2 -M"set Exif.GPSInfo.GPSLatitude $latDeg/1 $latMin/100 0/1" \
                -M"set Exif.GPSInfo.GPSLatitudeRef $latRef" \
          -M"set Exif.GPSInfo.GPSLongitude $lonDeg/1 $lonMin/100 0/1" \
                -M"set Exif.GPSInfo.GPSLongitudeRef $lonRef" \
         $fil
done
