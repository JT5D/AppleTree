# Adds an onMetaData tag and prints out the onMetaData tag data, but doesn’t write updated information back (simulation mode).
flvtool2 -UPs example.flv

# Adds an onMetaData tag and prints out debug information, but doesn’t write updated information back (simulation mode).
flvtool2 -UDs example.flv

# Cuts file after 2 seconds and writes it back to input-source.
flvtool2 -CU -o 2000 example.flv

# Adds an onMetaData tag and redirects writing to out.flv. bn
flvtool2 -U example.flv stdout out.flv

# Takes example.flv input from stdin (piped in), adds a onMetaData tag and writes file to out.flv.
cat example.flv | flvtool2 -U stdin out.flv

# Pipes the output of ffmpeg into FLVTool2, updates the stream with a onMetaTag and writes it to myvideo.flv (only works on Linux OS at the moment).
ffmpeg -i myvideo.mpg -f flv - | flvtool2 -U stdin myvideo.flv

# Overwrites an existing metadata value using the -key:value switch. In this case the duration timestamp is modified. 
flvtool2 -U -duration:55.435 example.flv
