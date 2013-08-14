# update
freshclam

# scan
clamscan --bell --recursive=yes --log=/home/$USER/virus_log -i /home/$USER

clamscan --tar=/bin/tar  myfile.tgz
find . -iname \*.exe -exec clamscan -r -i {} \;
