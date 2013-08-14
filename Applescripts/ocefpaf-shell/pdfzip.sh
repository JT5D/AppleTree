#!/bin/bash
#
# pdfzip.sh
#
# purpose:  Compress PDf files
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  30-Nov-2010
# modified: Tue 23 Apr 2013 01:12:31 PM BRT
#
# obs: http://www.ubuntugeek.com/
#      ubuntu-tiphowto-reduce-adobe-acrobat-file-size-from-command-line.html
#

# check dependencies
commds=( gs )
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
echo "usage: $cmd filein.pdf fileout.pdf"
echo
}

if [ "$1" == "--help" ] ; then
  echo
  help
  echo
  exit 0
fi

# input check
if [ $# -eq 2 ]; then
  filein="$1"
  fileot="$2"
else
  echo
  echo "error in $cmd"
  echo
  help
  echo
  exit 1
fi

#ver=$(file "$filein" | awk '{print $NF}')
#compare_result=`echo "$ver > 1.5" | bc`

#if [ $compare_result -eq 1 ]; then
    #echo "pdf already version 1.5 or higher"
    #exit 1
#fi

# get original metadata
metadata=$(mktemp --dry-run)
pdftk "$filein" dump_data output $metadata

if [ $? -ne 0 ]; then
  echo
  echo "Cannot get metadata. Exiting..."
  echo
  exit 1
fi

# compress pdf using ebook option
tmp=$(mktemp --dry-run).pdf
gs -sDEVICE=pdfwrite \
   -dCompatibilityLevel=1.5 \
   -dPDFSETTINGS=/ebook \
   -dNOPAUSE \
   -dQUIET \
   -dBATCH \
   -sOutputFile=$tmp "$filein"

if [ $? -ne 0 ]; then
  echo
  echo "Cannot compress pdf with gs. Exiting..."
  echo
  exit 1
fi

szin=$(stat --printf="%s" "$filein")
szot=$(stat --printf="%s" $tmp)

if [ $szin -lt $szot ] ; then
  echo
  echo "File created was bigger. Exiting..."
  echo
  exit 1
fi

# write original metadata back
if [ "$filein" != "$fileot" ] ; then
    pdftk ${tmp} update_info $metadata output "$fileot"
else
    scratch=$(mktemp --dry-run).pdf
    pdftk ${tmp} update_info $metadata output $scratch
    mv $scratch "$filein"
fi

perc=$(echo "scale=2; ($szin-$szot)/$szin*100" | bc)

echo
echo "compressing rate: ${perc}%"
echo

#-dPDFSETTINGS=/screen (screen-view-only quality, 72 dpi images)
#-dPDFSETTINGS=/ebook (low quality, 150 dpi images)
#gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dColorImageResolution=38 -dColorImageDownsampleType=/Average -dGrayImageDownsampleType=/Average -dGrayImageResolution=38 -dMonoImageResolution=38 -dMonoImageDownsampleType=/Average -dOptimize=true -dDownsampleColorImages=true -dDownsampleGrayImages=true -dDownsampleMonoImages=true -dUseCIEColor -dColorConversionStrategy=/sRGB -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf

# Ignore pdfmark issues.
#gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=output.pdf -c .setpdfwrite -f input.pdf
