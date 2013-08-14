# get info
ffmpeg -i video.avi

# encode for PSP
ffmpeg -i source_video.avi -b 300 -s 320x240 -vcodec xvid -ab 32 -ar 24000 -acodec aac final_video.mp4

# extract sound
ffmpeg -i source_video.avi -vn -ar 44100 -ac 2 -ab 192 -f mp3 sound.mp3

# AVI -> animated gif
ffmpeg -i video_origine.avi gif_anime.gif

# MPEG -> FLV
# uses h.264 = much better quality
# allows progressive download = starts playing straight away
ffmpeg -i foo.avi -vcodec libx264 -acodec libfaac -vb 700000 -f flv bar.f4v

# RMVB -> AVI:
mencoder ARQUIVO.rmvb -oac mp3lame -lameopts br=192 -ovc lavc -lavcopts vcodec=mpeg4:vhq -o NOVOARQUIVO.avi

# WMV -> AVI:
mencoder ARQUIVO.wmv -ofps 23.976 -ovc lavc -oac copy -o NOVOARQUIVO.avi

# MOV -> AVI:
mencoder -ovc lavc -lavcopts vcodec=mpeg4 -oac mp3lame -lameopts vbr=3 ARQUIVO.mov -o NOVOARQUIVO.avi -v

# FLV -> MPG:
ffmpeg -i ARQUIVO.flv -r 60 -ab 56 -ar 22050 -b 500 -s 320x240 NOVOARQUIVO.mpg

# MPG -> AVI:
mencoder ARQUIVO.mpg -ovc xvid -oac mp3lame -xvidencopts bitrate=800 -o NOVOARQUIVO.avi

# change size
ffmpeg -i video1.avi -ab 56 -ar 22050 -b 500 -s 800x600 video1.mpeg

# save stream-video
mplayer -dumpstream url/file.qtl -dumpfile output.mov
# or
mencoder -oac copy -ovc copy url/file.mov -o output.mov

# join videos
cat video1.mpg video2.mpg video3.mpg |
ffmpeg -y -i - -fflags genpts -vcodec copy -acodec copy video1+2+3.mpg

# videos from a list of figures
for file in *.png; do echo $file >> list.txt; done
mencoder mf://@list.txt -mf fps=10 -o test.avi -ovc lavc -lavcopts vcodec=msmpeg4v2:vbitrate=800

# decompress a video
ffmpeg -i compressed.any -vcodec rawvideo uncompressed.avi

# decompress to frames
ffmpeg -i compressed.any image_%d.bmp

# animated gif
gifsicle &#45&#45colors 256 -O1 -l0 -d20 frames*.gif &#62 movie.gif

# mplayer
  mplayer dvd://0 -dvd-device /mnt/dvdiso/
  mplayer -alang en dvd://0 -dvd-device /mnt/dvdiso/
  mplayer -sid 0 -alang en dvd://0 -dvd-device /mnt/dvdiso/
  mplayer -sid 1 -alang en dvd://1 -dvd-device /mnt/dvdiso/

# play only one VOB
  mplayer /mnt/video/video_ts/vts_01_4.vob
  mplayer -subdelay -23 -sub legenda.srt /mnt/dvdiso/video_ts/vts_01_4.vo

# extract audio
mplayer -dumpaudio old-file.flv -dumpfile new-file.mp3b
