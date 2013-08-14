HOW2:
    Select key type to use for newly created files:
    1) openssl
    2) passphrase
    3) tspi
    Selection: 2
    Passphrase:
    Select cipher:
    1) aes: blocksize = 16; min keysize = 16; max keysize = 32 (not loaded)
    2) blowfish: blocksize = 16; min keysize = 16; max keysize = 32 (not loaded)
    3) des3_ede: blocksize = 8; min keysize = 24; max keysize = 24 (not loaded)
    4) twofish: blocksize = 16; min keysize = 16; max keysize = 32 (not loaded)
    5) cast6: blocksize = 16; min keysize = 16; max keysize = 32 (not loaded)
    6) cast5: blocksize = 8; min keysize = 5; max keysize = 16 (not loaded)
    Selection [aes]:
    Select key bytes:
    1) 16
    2) 32
    3) 24
    Selection [16]:
    Enable plaintext passthrough (y/n) [n]: N
    Enable plaintext passthrough (y/n) [n]: n
    Enable filename encryption (y/n) [n]:
    Attempting to mount with the following options:
    ecryptfs_unlink_sigs
    ecryptfs_key_bytes=16
    ecryptfs_cipher=aes
    ecryptfs_sig=6ecfe823eb71f8f9
    WARNING: Based on the contents of [/root/.ecryptfs/sig-cache.txt],
    it looks like you have never mounted with this key
    before. This could mean that you have typed your
    passphrase wrong.

    Would you like to proceed with the mount (yes/no)? yes
    Would you like to append sig [6ecfe823eb71f8f9] to
    [/root/.ecryptfs/sig-cache.txt]
    in order to avoid this warning in the future (yes/no)? yes
    Successfully appended new sig to user sig cache file
    Mounted eCryptfs

    Now copy some files to ~/secrets

    and umount ~/secrets and check if you read the files.

mount -t ecryptfs ~/secrets ~/secrets
umount ~/secrets