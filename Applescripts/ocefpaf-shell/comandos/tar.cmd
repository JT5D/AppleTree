# Tar with password:
tar -zcvf - docs |openssl des3 -salt -k <senhasecreta> | dd of=documentos.des3

# Restore:
dd if=documentos.des3 |openssl des3 -d -k <senhasecreta> |tar xvzf -
