# sort by 1st field in crescent order 
sort data.dat

# by 2nd field
sort +1 data.dat

# no case sensity
sort -f data.dat

# igonre blank spaces
sort -b +0 data.dat

# sort decrescent
sort -r data.dat

# assume 2nd field is numeric and not aligned
sort -n +1 data.dat

# use ':' as field separator
sort -t: data.dat
