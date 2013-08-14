# set attribute metadata
setfattr -n user.comment -v "this is a comment" testfile

# get attribute
getfattr testfile
getfattr -n user.comment testfile

# rw to another user via ACL
setfacl -m u:usr2:rw testfile

# get ACL
getfacl testfile
