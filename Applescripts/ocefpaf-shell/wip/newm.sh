#!/bin/bash
 
# newm
#
# purpose:  create a new mfile
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     15-Mar-09
# modified: 24-Nov-09
#
# obs: not a smart way for functions yet
#

#input check
if [ $# -eq 1 ]; then
  filename=$1
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "usage: $(basename $0) mfile.m"
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
1) create a script
2) create a function'
read resp

# header info
today=$(date +%d-%b-%Y)
autor="Filipe P. A. Fernandes"
email="ocefpaf@gmail.com"
  web="http://ocefpaf.tiddlyspot.com/"
 base=$(basename $filename .m)

if [ "$resp" = "2" ]; then
echo "function [output] = $base(input)
% $filename -> description of what the function performs
%
%   call:  [output] = $base(input);
%
%  input:  var1 -> description
%          var2 -> description
%
% output:  var1 -> description
%          var2 -> description 
%
% example: [output] = $base(input);
%
% m-files required: none
%        MAT-files: none
% 
" > $filename
fi

# make header
echo "% 
% $filename
% author:   $autor
% e-mail:   $email
% web:      $web
% date:     $today
% modified: $today
%
% obs: 
%
" >> $filename
