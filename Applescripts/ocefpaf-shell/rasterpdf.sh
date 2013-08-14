#!/bin/bash
#
# rasterpdf.sh
#
# purpose:  rasterize PDFs
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  10-Mar-2011
# modified: Thu 10 Mar 2011 02:41:23 PM EST
#
# obs: from ncl list
#

# check dependencies
commds=( pdf2ps ps2pdf )
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
echo "Rasteraize, or Flatten, a pdf"
echo "usage: $cmd pdfin pdfout"
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
  pdfin=$1
 pdfout=$2
else
  echo
  echo "error in $cmd"
  echo
  help
  echo
  exit 1
fi

pdf2ps ${pdfin} - | ps2pdf - ${pdfout}
