# starts VBox
/usr/bin/VirtualBox --startvm winxp-office

# gets UUID
VBoxManage list vms

# sun image time (in ms)
VBoxManage modifyvm "UUID" -bioslogodisplaytime 100

# modify sun image
VBoxManage modifyvm "UUID" -bioslogoimagepath path-to-the-image

# no boot menu
VBoxManage modifyvm "UUID" -biosbootmenu disabled

# creat disk size (in MB)
VBoxManage createvdi -filename fourgig -size 4096 -register

# adds disk as the primary slave disk in the Fedora VM
VBoxManage modifyvm "UUID" -hdb fourgig

# log all traffic
VBoxManage modifyvm "UUID" -nictrace1 on -nictracefile1 /tmp/nictraffic.log

# clone machine
VBoxManage clonehd vista.vdi vista-alt.vdi
