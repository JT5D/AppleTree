#!/bin/bash

# latexit
#
# purpose:  quick-and-dirty latex
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     29-Jul-10
# modified: 29-Jul-10
#
# obs: http://ilorentz.org/~gio/latexit.html
# try sympy latex to create a visualization
#

# check dependencies
commds=( gs pdflatex pdfcrop )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

# help section
cmd=$(basename $0) # get script name

if [ "$1" == "--help" ] ; then
  echo
  echo "usage: $cmd \"e^{i\pi} = -1\" math"
  echo
  exit 0
fi

# input check
if [ $# -eq 2 ]; then
  latext=$1
     out=$2
else
  echo "________________________________________________________________"
  echo
  echo "error in $cmd"
  echo
  echo "type $cmd --help for info"
  echo "________________________________________________________________"
  exit 1
fi


# temporary file
tmp=$(basename $(mktemp --dry-run))

# latex header
echo "\documentclass[a1paper]{article} \usepackage[landscape]{geometry} \begin{document} \pagestyle{empty} \[" > ${tmp}.tex

if(test -e $latext ) then
   cat $latext >> ${tmp}.tex
else
   echo $latext >> ${tmp}.tex
fi
echo "\]\end{document}" >> ${tmp}.tex

pdflatex ${tmp}.tex
pdfcrop ${tmp}.pdf ${tmp}.pdf.out
gs -sDEVICE=pswrite -dNOCACHE -sOutputFile=$out -q -dbatch -dNOPAUSE ${tmp}.pdf.out -c quit
ps2pdf $out
# cleanup
rm ${tmp}.{pdf,tex,aux,log,pdf.out} $out
