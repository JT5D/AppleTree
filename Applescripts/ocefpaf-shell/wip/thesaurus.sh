#!/bin/bash

#
# Thesaurus - Find something original to say :)
#
# 2008 - Mike Golvach - eggi@comcast.net
#
# Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License
#

if [ $# -lt 1 ]
then
 echo "Usage: $0 YourThesaurusTerm"
 echo "May be two or more words separated"
 echo "by spaces, but only one definition"
 echo "per execution."
 echo "Ex: $0 goodness"
 echo "Ex: $0 goodness gracious"
 exit 1
fi

args="$@"
wget=/usr/bin/wget

if [ $# -gt 1 ]
then
 args=`echo $args|sed 's/ /%20/g'`
fi

echo
$wget -nv -O - http://thesaurus.reference.com/search?q="$args" 2>&1|egrep -i 'Synonyms:|Definition:|No results found|Thesaurus suggestions:'|sed -e 's/<br \/>/\n/g' -e 's/<[^>]*>//g' -e 's/ / /g' -e 's/\(.\)$/\1\n/' -e 's/Would you.*$//'

exit 0
