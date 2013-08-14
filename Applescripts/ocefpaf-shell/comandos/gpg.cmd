# encrypt, wipe and Obfuscate filename
gpgdir --Wipe --Obfuscate-filename --encrypt dir

# decrypt
gpgdir --decrypt dir
gpgdir -O --verbose --decrypt dir
