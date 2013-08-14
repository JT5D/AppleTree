# check file info/type
file filename

# follow file update
tail -f

# umask
umask 0077

# file to vector
mapfile vet < file.txt
echo ${vet[@]}

# 'cat' for columns
paste -d" " file1 file2 > merge

# reverse 'cat'
tac filename

# format line to 40 characters of width
fmt -40 filename

# save screen
import -window root tela.png

# compare two files
diff file1 file2

# brake into 10 files the file arq1 at the word Capítulo into files Capit00, Capit01...
csplit -k -f Capit arq1 "/Capítulo/" {9}

# add path to end/begin
PATH=/dir:$PATH
PATH=$PATH:/dir
export PATH

# update locate database
updatedb

# MD5SUM
md5sum filename(s) > MD5SUM # create
md5sum --check MD5SUM       # check

# WC
wc -l -w -c (linha/palavra/caracter)

# memory process
ps aux | sort -k 4 -r | head -n 2

# list process that are holding a file device
lsof /mnt/sdb1

# compile a shell script
shc -r -v -f hello.sh

# file info
stat {file-name}

# remove system speaker
modprobe -r pcspkr

# add to path with subdirectories
DIRS=`echo /foo/bar/baz/*`
export PATH=$PATH:${DIRS// /:

# run two commands
command1 && command2 # run command2 if command1 is successful
command1 || command2 # run command2 if command1 is unsuccessful

# Check jobs and send job 2 to foreground
jobs
fg 2

# show programs using internet
lsof -P -i -n

# bash tricks
read -sn 1 -p "Press any key to continue..."
