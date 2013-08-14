# info
ffmpeg -i file

# automatic detection conversion
ffmpeg -i input_file.wav output_file.avi

# DVD
ffmpeg -i file.avi -target ntsc-dvd file.mpg

# VCD
ffmpeg -i movie.avi -target pal-vcd movie.mpg

# video codecs -vcodec, audio codec -acodec, size -s, frame bit rate -r, video bit rate -b, audio frequency -ar, audio bit rate -ab, force format -f
ffmpeg -i file.mpg -vcodec mpeg4 -s 320x240 -b 300k -r 10 -acodec mp3 -ar 22050 -ab 64k -f avi file.avi

# cropping video
ffmpeg -i file.avi -croptop 25 -cropbottom 25 file_crop.mpg

# padding video (white)
fmpeg -i file.mpg -padtop 44 -padbottom 46 -padcolor 000000 -f avi file_pad.avi

# extracting audio from video
ffmpeg -i show.avi -vn show_audio.mp3

# capturing audio and video (vide4linux)
ffmpeg /tmp/out.mpg

# capture screen
size=$(xdpyinfo  | grep 'dimensions:')

ffmpeg -f x11grab -s 800x600 -r 25 -i :0.0 -sameq /tmp/out.mpg
# -s wxga set to 1366x768
ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -sameq /tmp/out.mpg

# another screen cast
ffmpeg -f alsa -ac 2 -i hw:0,0 -f x11grab -r 30 -s $(xwininfo -root | \grep 'geometry' | awk '{print $2;}') -i :0.0 -acodec pcm_s16le -vcodec libx264 -vpre lossless_ultrafast -threads 0 -y output.avi


# two way compression
ffmpeg -i mar555_lecture8.avi -b 200k -ab 32k -ar 22050 -s 640x480 -pass 1 -passlogfile log_file -acodec libmp3lame -f flv  lecture8.flv
ffmpeg -i mar555_lecture8.avi -b 200k -ab 32k -ar 22050 -s 640x480 -pass 1 -passlogfile log_file -acodec libmp3lame -f flv  lecture8.flv

# from pipe
> gource seawater_log.txt --auto-skip-seconds 1 --seconds-per-day 3 -user-image-dir images --output-ppm-stream - | ffmpeg -y -b 3000K -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -vpre slow -threads 0 gource.mp4
