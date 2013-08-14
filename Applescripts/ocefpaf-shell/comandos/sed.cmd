# delete a line
sed '3d' fileName.txt

# delete the line containing awk
sed '/awk/d' filename.txt

# remove all empty lines
sed '/^$/d' filename.txt      
sed '/./!d' filename.txt

# change (first if any) occurrence on any line of TD to AB 
sed 's/TD/AB/' my.dat # for global use g

# remove html tags
sed -e 's/<[^>]*>//g'

# change any 2 in last position of line to 0
sed 's/2$/0/' my.dat

# for first 2 adjacent upper cases letters, reverse and put a space in between.
sed 's/\([A-Z]\)\([A-Z]\)/\2 \1/' my.dat

# put space after first digit
sed 's/\([0-9]\)/\1 /' my.dat

# convert dates from mm/dd/yy notation to yy/mm/dd form (for sorting by dates)
sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/\3\1\2/g' my.dat

# eliminate comments and empty lines
sed -e 's/#.*//;/^$/d' thegeekstuff.txt

# add commas to number
sed 's/\(^\|[^0-9.]\)\([0-9]\+\)\([0-9]\{3\}\)/\1\2,\3/g' numbers

# parenthesize first character of each word
echo "Welcome To The Geek Stuff" | sed 's/\(\b[A-Z]\)/\(\1\)/g'

# add <<< >>> to the beginning and end of each line
sed 's@^.*$@<<<&>>>@g' path.txt

# change /usr/bin to /usr/bin/local
sed 's@/usr/bin@&/local@g' path.txt
