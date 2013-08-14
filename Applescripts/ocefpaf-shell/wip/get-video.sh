# Loop through the file
for line in $(< lista.txt); do
    out=$(basename $line)
    mplayer -noframedrop -dumpfile $out -dumpstream $line
done
