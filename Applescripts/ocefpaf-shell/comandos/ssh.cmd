# shared key
ssh-keygen -t dsa -f ~/.ssh/id_dsa
ssh-copy-id -i ~/.ssh/id_dsa.pub user@remote_machine

# from localhost:2001 to somemachine:80
# or -L port:host:hostport
ssh -N -L2001:localhost:80 somemachine

# mount remoter folder
sshfs name@server:/path/to/folder /path/to/mount/point
fusermount -u /path/to/mount/point
