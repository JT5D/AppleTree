# continue from where it stopped last time
wget -c http://www.anysite.com/file.zip

# run in background and save "wget.log" report
wget -b http://www.anysite.com/file.zip

# whole site recursively
wget -r http://www.anysite.com/

# ignore robots
wget -r -erobots=off http://www.anysite.com/

# get png files from level 1 (1-4) without creating directories
wget -r -erobots=off -l1 --no-parent -A.png -nd http://www.anysite.com/dir/
 
# mirror whole site 
wget -m http://www.anysite.com/

# option to fake browser
--user-agent=”Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)“

# user and passwd
wget http://user:passwd@server.com/file.etc

# or
 wget --http-user=username --http-passwd=senha url

# download all mp3 files from the page links
wget --ignore-tags=img -r "http://www.blocparty.net/mp3.html

# only that dir without index files
wget -r --no-parent --reject "index.html*" http://mysite.com/configs/.vim/

# specific directories
wget -nH --cut-dirs=1 ftp.xemacs.org/pub/xemacs

no options -ftp.xemacs.org/pub/xemacs/
    * -nH -pub/xemacs/
    * -nH --cut-dirs=1 -xemacs/
    * -nH --cut-dirs=2 -.
    * --cut-dirs=1 -ftp.xemacs.org/xemacs/
