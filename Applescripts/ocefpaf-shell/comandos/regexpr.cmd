# add extension to files
rename 's/$/.txt/g' *

# remove spaces
rename "s/ *//g" *.mp3

# convert all letters to lowercase
rename 'y/A-Z/a-z/' *

# remove domains by key-words
zcat /path/to/log | egrep -f /etc/squid/palavraschavepornografia | awk '{print $7}' | sed 's/http:\/\///' | sed 's/\/.*$//' | sort | uniq -c

# steps
 -> de-compress the file: zcat /path/to/log 
 -> search key-words: egrep -f /etc/squid/keyword |
 -> get url only: awk '{print $7}'
 -> remove http:// from url: sed 's/http:\/\///'
 -> remove the the end of the url: sed 's/\/.*$//' 
 -> sort and remove reptition (-c): sort | uniq -c
