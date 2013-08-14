# resize
convert -density 300x300 -resize 1000x1000 sst.pdf sst.png
mogrify -resize 320x240 *.jpg
mogrify -resize 320x240! *.jpg
convert image.jpg -resize 50% image.png

# batch (wallpaper.)
for file in *.jpg; do convert $file -resize 640x480 640x480-$file; done

# geometry/resize
convert -geometry 45x45 foto_source.jpg foto_dest.geometry.jpg
convert -resize 35x35 (50%) foto_source.jpg foto_dest.resize.jpg
convert -size 75x75  foto_source.jpg foto_dest.size.jpg

# thumbnail, remove extra info from image
convert -thumbnail '100x150' foto_source.jpg foto_dest.thumbnail.jpg # fixed size
convert -thumbnail '100x150>' foto_source.jpg foto_dest.thumbnail.jpg # fixed width
convert -thumbnail '100x150>' -bordercolor snow -background black \
          +polaroid foto.jpg foto_thumbnailpolarid.png # fancy border 1
convert -thumbnail '100x150>' -matte -background none \
          -vignette 0x4 foto.jpg foto_thumbnail2.png # fancy border 2
convert -thumbnail '100x150>' -matte -virtual-pixel transparent \
          -channel A -blur 0x8  -level 0,50% +channel foto.jpg thumbnail_softedge.png # fancy border 3

# batch thumbnail
for file in *.jpg; do convert $file -thumbnail 125x -quality 85 tn-$file; done

# jpeg quality
convert -quality 80% imagem.jpg

# rotate image 90 degress
convert -rotate 90 foto_source.jpg foto_dest.rotate.jpg

# blur
convert -blur 50x50 foto_source.jpg foto_dest.blur.jpg

# colorize
convert -colorize 45 foto_source.jpg foto_dest.colorize.jpg

# combine two pictures
convert -combine foto_source1.jpg foto_source2.jpg foto_dest.combine.jpg

# contrast
convert -contrast foto_source.jpg foto_dest.contrast.jpg

# cycle the color map 
convert -cycle 50 foto_source.jpg foto_dest.cycle.jpg

# flip vertically 
convert -flip foto_source.jpg foto_dest.flip.jpg

# flop, flip horizontally 
convert -flop foto_source.jpg foto_dest.flop.jpg

# add a frame
convert -frame 60x60 foto_source.jpg foto_dest.frame.jpg

# monochrome
convert -monochrome foto_source.jpg foto_dest.monochrome.jpg

# negate/solarize 
convert -negate foto_source.jpg foto_dest.negate.jpg
convert -solarize 7 foto_source.jpg foto_dest.solarize.jpg

# sepia tone
convert -sepia-tone 0.7 foto_source.jpg foto_dest.sepia-tone.jpg

# add a background 
convert -splice 60x60 foto_source.jpg foto_dest.splice.jpg

# apply median filter 
convert -median 10 foto_source.jpg foto_dest.median.jpg

# emboss
convert -emboss 5 foto_source.jpg foto_dest.emboss.jpg

# simulate oil paint
convert -paint 9 foto_source.jpg foto_dest.paint.jpg

# noise
convert -noise 15  foto_source.jpg foto_dest.noise.jpg

# crayons effect 
convert -lat 70x70 foto_source.jpg foto_dest.lat.jpg

# dropshadow
convert image1.png \( +clone -background black -shadow 60x5+30+40 \) +swap -background none -layers merge +repage image2.png
convert deer1.jpg \( +clone -background black -shadow 60x5+30+40 \) +swap -background white -layers merge +repage deer2.png
# batch
for file in *.jpg; do convert $file \( +clone -background black -shadow 60x5+30+40 \) +swap -background white -layers merge +repage shadow-$file; done

# raise button
convert thumbnail.jpg -raise 10 raised-thumbnail.jpg

# ps to obj
pstoedit -f tgif cb_costa.ps cb_costa.obj

# reduce depth to 4 bits and strip comments then run optipng
convert -strip -depth 4 foo.png foo.png # lossy
optipng -o9 foo.png foo.png

# make tranparent figure
convert -fuzz 5% -transparent "#000000" image.jpg image_new.png

# transparent
convert -transparent white fig.in fig.out

# ps to fig
pstoedit -f fig page.ps page.fig

# fig to svg
fig2dev -L svg page.fig page.svg

# pngcrush
optipng -v -fix -force -keep -preserve -full -o7 file.png

# animated gif
convert *.jpg myanimated.gif

# others
rsvg-convert --dpi-x=150 --dpi-y=150 final.svg -o final.png
svg2pdf final.svg final.pdf
inkape final.svg --export-png=final.png
