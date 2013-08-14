# Duplicate list
fdupes --recurse . | tee filelist

# Duplicate list removing the first occurence
fdupes --recurse --omitfirst . | tee filelist-omit-first

# Clean list
sort filelist-omit-first | uniq | grep -v '^$' > removelist

# Remove
for file in $(cat removelist); do rm $file; done
