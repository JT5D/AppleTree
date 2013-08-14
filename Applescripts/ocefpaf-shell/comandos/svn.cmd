# create a repositoy directory
mkdir REPO

# inside the directory create the project
svnadmin create project

# import the data to the repository
svn import origin-dir file:///REPO/project/trunk -m "Import of project: rev 0"

# check out a copy
svn co file:///REPO/project/trunk workdir

# check differences before commit
svn diff

# add files before commit
svn st | grep '^?' | awk -F "      " '{print $2}' | xargs svn add

# remove files before commit
svn st | grep '^!' | awk -F "      " '{print $2}' | xargs svn delete

# solution for files with spaces
svn status | grep "^?" | awk -F "      " '{print $2}' | tr "\n" "\0" | xargs -0 svn add

# to commit the changes
svn commit -m "log message e.g.: rev 1"

# check the log
svn log
svn log -r 5:HEAD # for a particular revision

# update the copy
svn update

# remove all .svn directories
find . -name .svn -print0 | xargs -0 rm -rf

# verbose log +  downloading a specific file from past revision
svn log --verbose
svn up -r 5 file

# long log foe Google Summer of Code.
svn log | awk '/^r.+USERNAME/{print $1}'|xargs -l svn diff -c > code.diff
