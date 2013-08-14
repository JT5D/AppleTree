# empty directories
find /path -depth -type d -empty

# empty files
find /path -depth -type f -empty

# specific name
find /path -name name_of_file

# specific extensions
find /path -name "*.ext"

# specific permissions
find /path -name '*.txt' -perm 644

# given permissions
find /path -perm -permision_bits

# given name and any extension
find /path -name 'given_name.*'

# modified in the latest blocks of n hours
find /path -mtime n
# accessed in the latest blocks of n hours:
find -atime n
#    n is:
#    * 0 for the last 24 hours
#    * 1 for the last 48 hours
#    * 2 for the last 72 hours

find ~ -type f -mtime 0 -iname '*.mp3'

# according to owner
find /path -user root

# remove file using inode
find . -inum [inode-number] -exec rm -i {} \;

# remove empty directory
find -depth -type d -empty -exec rmdir {} \;

# remove files *~
find . -type f -name "*~" | xargs -i bash -c "echo removendo {}; rm {}"

# remove all .svn recursively
find . -name .svn -print0 | xargs -0 rm -rf

# change user:group for (d) directories and (f) files use (-R) for recursive
sudo find . -type d -exec chown filipe:users {} \;

# change permission for files (f) directories (d)
find . -type f -exec chmod 644/664/600 {} \;
find . -type d -exec chmod 755/775/700 {} \;

# equalize MP3
find . -type f -iname '*.mp3' -print0 | xargs -0 mp3gain -r -k

# compress firefox database
find $HOME/.mozilla/firefox -type f -name  *.sqlite  -exec sqlite3 {} vacuum \;

# search a word inside certain files
find . -type f -name "*.ext" -exec grep "word" '{}' \; -print

# find by size
find . -name "*.avi" -size -9000k -exec mv {} ./Curtas/. \;

# Largest 10 files.
find . -type f -exec du {} \; 2>/dev/null | sort -n | tail -n 10 | xargs -n 1 du -h 2>/dev/null

# find top 5 big files
find . -type f -exec ls -s {} \; | sort -n -r | head -5

# Latest changed (5 minutes)
find . -mmin -5 -type f

# Between 10 and 20 minutes
find . -mmin +10 -mmin -20 -type f

# remove zero byte files
find . -type f -size 0 -exec rm {} \;

# remove empty directories
find -depth -type d -empty -exec rmdir {} \;

# what is not compress and compress redirecting the output to a log and errlog
find . -type f ! -name "*.bz2" -exec bzip2 --compress --force --verbose --best {} \; 1> log 2> err

# compute size by extension
find . -name '*.nc' -exec ls -l {} \; | awk '{ SUM += } END { print SUM/1024/1024 }'

# same as above but not very good for several dirs
find . -type f -name "*.tar" -exec du -shc {} + | tail -1 | awk '{print $1}'

# vacuum firefox
find ~ -name '*.sqlite' -exec sqlite3 '{}' 'VACUUM;' \;
