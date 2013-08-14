# edit .hgrc
[ui]
username = John Doe <john@example.com>

# clone
hg clone http://... myrepodir

# update from parent, at myrepodir
hg pull http://... # get changesets
hg update # (or up) update workdir

# check
hg parents # (or par)

# history
hg log
hg log -v
hg log -r{x} # revision x
hg log -r{x} -p # check patches for revision x
hg tip # latest change

# check local modifications
hg status

# diff a repo (or a file in the repo)
hg diff

# revert a file
hg revert hello.c # create a hello.c.orig with the modifications

# commit
hg ci

# send commits to parent
hg push

# export changes
hg export tip

# get revision
rev=$(hg tip -q | cut -d":" -f1)

# Server
hg serve
http://localhost:8000

# archive
hg archive --type tbz2 --prefix python-seawater ../python-seawater-%R.tar.bz2
