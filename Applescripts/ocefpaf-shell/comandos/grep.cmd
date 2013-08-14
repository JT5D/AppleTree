# search 'extreme value' no case sensitive, add line number
grep -n -i 'extreme value' texto.txt

# only at the beginning of the line
grep '^512' *.dat

# end of the line
grep '512$' *.dat

# lines that start with '508', or '518', ..., up to '598'
grep '^5[0-9]8' *.dat

# all but those that begin with 5
grep -v '^5' *.dat

# all lines that begin with 5?8 where ? exclude 1 and 6 6
grep '^5[^1,6]8' *.dat

# lines that start with 52, any number of digits after UE
grep '^52[0-9]*UE' *.dat

# x lines before (B) after (A) palavra
grep -AX -BX palavra

# grep + find
find . -name "*.r" -exec grep "rho" '{}' \; -print

# youtube videos from a html
grep -E 'http://www.youtube.com/watch\?v=[[:alnum:]-]{11}' dump.html -o | uniq
