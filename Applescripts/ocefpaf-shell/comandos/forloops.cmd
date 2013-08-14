# rename as a sequence od numbers
ctd=1 ; for i in * ; do zeros=$(printf "%03d\n" ${ctd}) ; mv $i Foto_${zeros}.jpg ; ((ctd++)) ; done

# apply optipng to all png inside subdirectories
for png in $(ls -R ./*.png); do optipng $png ; done

# rename
for f in ?.png ; do mv $f 00$f; done
for f in ??.png ; do mv $f 0$f; done
for arq to *. JPG; do mv $arq ${arq/.JPG/.jpg};don

# rename with counter
count=1; for file in *.png; do echo "mv ${file} `printf %3d
${count}`.png"; count=`expr ${count} + 1`; done

# rename to the left of _
for f in *.jpg; do mv "$f" "${f#_}"; done

# rename to the right of t
for f in *.txt; do mv "$f" "${f%t*.txt}.txt"; done

# alternative to for
find . -type f -name "*.mpg" -exec mp4ize {} \;

# from a file list with spaces
while IFS=$(echo -en "\n\b") ; read -r file ; do mv $file . ; done < tmp
