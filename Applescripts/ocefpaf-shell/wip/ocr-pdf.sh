#!/bin/bash
#
# ocr-pdf.sh
#
# purpose:  Convert "raster" PDF to searchable PDF
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  21-Apr-2011
# modified: Thu 21 Apr 2011 04:43:37 PM EDT
#
# obs: http://blog.konradvoelkel.de/2010/01/linux-ocr-and-pdf-problem-solved/
#

# check dependencies
commds=( pdftk convert cuneiform hocr2pdf )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    echo "type cnf ${commd}"
    exit 1
  fi
done

# nice way to pass $0
cmd=$(basename $0 .sh)

# help section
help()
{
echo
echo "usage: $cmd file.pdf lang"
echo
}

if [ "$1" == "--help" ] ; then
  echo; help; echo
  exit 0
fi

# input check
if [ $# -eq 2 ]; then
  pdffile=$1
     lang=$2
else
  echo
  echo "error in $cmd"
  echo
  help
  echo
  exit 1
fi

set -x

# burst pages
pdftk "$pdffile" burst dont_ask

# create pixel image
for f in pg_*.pdf; do
    echo "converting $f ..."
    name=$(basename $f .pdf)
#     convert -quiet -rotate $[90*$2] -monochrome -normalize -density 300 "$f" "$f.png"
#     convert -quiet -monochrome -normalize -density 300 "$f" "$name.bmp" # cuneiform
    convert -quiet -density 300 -depth 8 "$f" "$name.tif" # tesseract
#     convert -quiet -crop $6x$7+$4+$5 "$f.png" "$f.png"
# split
    # if [ "1" = "$3" ]; then
    #     convert -quiet -crop $[$6/2]x$7+0+0 "$f.png" "$f.1.png"
    #     convert -quiet -crop 0x$7+$[$6/2]+0 "$f.png" "$f.2.png"
    #     rm -f "$f.png"
#     fi
    rm -f "$f"
done

# cuneiform
for f in *.bmp; do
    name=$(basename $f .bmp)
    cuneiform -l $lang -f hocr -o "$name.hocr" "$f"
    convert -blur 0.4 "$f" "$f"
    hocr2pdf -i "$f" -s -o "$name.pdf" < "$name.hocr"
#     rm -f "$f" "$name.hocr"
done

# for f in *.tif; do
# #     name=$(basename $f .tif)
#     tesseract "$f" "$f" hocr #Can't open hocr
#     echo "Merging TIFF and hOCR into PDF file at 150 DPI..."
#     # Downsample to cut down on file bloat
#     hocr2pdf -r 150 -i "$f" -o "$f.pdf" <"$f.tif.html"
#     rm -f "$f" "$f.tif.html"
# done

out="$(basename $pdffile .pdf)-ocr.pdf"
# pdftk pg_*.pdf cat output $(basename $pdffile .pdf)-ocr.pdf
pdfjoin --fitpaper --tidy --outfile $out "pg_*.pdf"
# rm -f pg_*
# pdftk $out update_info doc_data.txt output $out-02
# pdftk $out-02 update_info in.info output $out-02
# mv $out-03 $out
# # rm -f $out-02 $out-02 doc_data.txt in.info