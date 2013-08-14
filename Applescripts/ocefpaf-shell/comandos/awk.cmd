# add a 00 column at the forth entry if it is not there.
awk '{if(!$4) $4="00" ;print}' arquivo

# find longest line
awk '{ if (length($0) > max) max = length($0) } END { print max }' data

# same as above
expand data | awk '{ if (x < length()) x = length() } END { print "maximum line length is " x }'

# lines larger than 80
awk 'length($0) > 80' data

# lines with at least 1 field
awk 'NF > 0' data

# random number from 0-100
awk 'BEGIN { for (i = 1; i <= 7; i++) print int(101 * rand()) }'

# pipe to get the 5th column
ls -l files | awk '{ x += $5 } END { print "total K-bytes: " (x + 1023)/1024 }'

# get first line separated by ":" and sort
awk -F: '{ print $1 }' /etc/passwd | sort

# number of lines in a file
awk 'END { print NR }' data

# get odd lines (== 1 for even)
awk 'NR % 2 == 0' data

# if 6th column is Nov add to 5th column
ls -l | awk '$6 == "Nov" { sum += $5 } END { print sum }'

# use \ to continue
awk '/This regular expression is too long, so continue it\
 on the next line/ { print $1 }'

# get all lines from 6th column that have J
ls -l | awk '{ if ($6 ~ /J/) print }'

# same but all excluding J
ls -l | awk '{ if ($6 !~ /J/) print }'

# use \ for special characters
awk 'BEGIN { print "He said \"hi!\" to the bar \\." }'

# get column 1 and 3 from file
awk '{print $1,$3}' my.dat

# format as C
awk '{printf "%4d %8.4f\n",  $1, $2}' my.dat

# sum to first column 
awk '{s+=$1} END {print s}' my.dat

# execute a awk script in a file
awk -f awkfile filename

# all alphanumeric
awk '/[[:alnum:]]/'  filename

# get lines with ...999... at 2nd column
awk '$2 ~/999/'  filename

# exact 999
awk '$2 =="999"'  filename

# show every 10th line 
awk 'print (NR%10)' filename

# get 10th field when some fields have lost numeric values or nospace between them
awk 'BEGIN {FIELDWIDTHS="5 5 5 5 2 3 2 2 9 8 8 8 8 8"} {print $10}' filename

# wraps with ">" for offset and "{{{ }}}" for Tiddlywiki verbatim
awk '{print "> {{{" $0}' $1 | awk '{print $0 "}}}"}'

# double-space a file
awk '1; { print "" }'

# dos2unix
awk '{ sub(/\r$/,""); print }'

# unix2dos
awk '{ sub(/$/,"\r"); print }'

# print and sort
awk -F ":" '{ print $1 | "sort" }' /etc/passwd

# transpose a text
awk -F "," '{ for (f = 1; f <= NF; f++) a[NR, f] = $f } NF > nf { nf = NF } END { for (f = 1; f <= nf; f++) for (r = 1; r <= NR; r++) printf a[r, f] (r==NR ? RS : FS) }' tmp
