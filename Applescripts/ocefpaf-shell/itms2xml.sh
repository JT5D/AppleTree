#!/bin/bash
 
# itms2xml
#
# purpose:  convert itunes podcast to amarok
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     28-Feb-09
# modified: 24-Nov-09
#
# obs: automatic adds podcast to amarok, this probably won't work with amarok 2.0
# source: http://www.kde-apps.org/content/show.php/add+iTunes+Store+Podcast+-+itms2xml?content=78720
#

# check dependencies
commds=( amarok )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

#input check
if [ $# -eq 1 ]; then
  url=$1
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage:  $(basename $0) url"
  echo "________________________________________________________________"
  exit 1
fi

# ID from link
IDENT="$(echo $1 | sed -n "s/.*viewPodcast?id=// ;1 p ;1 q" )"

# info file from iTunes Music Store
wget "http://ax.phobos.apple.com.edgesuite.net/WebObjects/MZStore.woa/wa/viewPodcast?id=$IDENT&amp;ign-mscache=1"

# 1 line of the file and take what you find between <string> and </string>
FEED="$(zcat view* | grep -m 1 feedURL | sed -e 's/<[^>]*>//g' | sed -e 's/.*feedURL//g' )"
echo 
echo "Podcast ID Number in Apple Music Store: $IDENT"
echo "Link to XML feed:                       $FEED"

#remove temp files
rm -rf browser* viewP*

#add to amarok podcast list
dcop amarok playlistbrowser addPodcast "$FEED"