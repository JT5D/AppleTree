# create an from a CD/DVD
dd if=/dev/cdrom of=~/imagem.iso

# from a directory
mkisofs -r -o imagem.iso /dir/

# mount iso
sudo mount -t iso9660 -o loop imagem.iso /media/iso

# bin/bue to iso
bchunk file.bin file.cue file.iso

# nero to iso
nrg2iso image.nrg image.iso
