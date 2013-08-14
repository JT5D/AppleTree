#!/bin/bash
 
# newF90
#
# purpose:  new F90 program
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     15-Mar-09
# modified: 24-Nov-09
#
# obs: simple header and initials
#

# check dependencies
commds=( kate )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

#input check
if [ $# -eq 1 ]; then
  filename=$1 # filename
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) fortran_prog.F90"
  echo "________________________________________________________________"
  exit 1
fi

if [ -e "$filename" ]; then
  echo
  echo "$filename exists"
  echo
  exit 1
fi

# text menu
echo '
1) create F90, do not open file
2) create F90, open file with kate 
1 or 2'
read resp

# header info
data=`date +%d-%b-%y`
autor="Filipe P. A. Fernandes"
email="ocefpaf@gmail.com"
web="http://ocefpaf.tiddlyspot.com/"
base=`basename $filename .F90`

# make header
echo "! $filename
!
! purpose:   
! author:   $autor
! e-mail:   $email
! web:      $web
! date:     $data
! modified: $data
!
! obs: 
!

      PROGRAM $base

      IMPLICIT NONE

      END PROGRAM $base
" > $filename

# check answer from menu
if [ "$resp" = "1" ]; then
  exit 0
elif [ "$resp" = "2" ]; then
  kate $filename &
fi