# image info
identify image.png

# more info
identify -verbose image.png

# print size in inches of an image at 72 DPI
identify -format "%[fx:w/72] by %[fx:h/72] inches" document.png

# depth and dimensions of a raw image must be specified on the command line
identify -depth 8 -size 640x480 image.raw

# display the image texture features and the number of unique colors
identify -verbose -features 1 -unique image.png
