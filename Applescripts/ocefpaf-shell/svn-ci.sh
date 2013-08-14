#!/bin/bash
#
# svn-ci.sh
#
# purpose:  Commit changues and add/delete files to subversion repository
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  28-Aug-2010
# modified: Sat 28 Aug 2010 05:06:15 PM EDT
#
# obs:
# source: http://gael-varoquaux.info/computers/svnautocommit/svnautocommit

# check dependencies
commds=( svn )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

# nice way to pass $0
cmd=$(basename $0 .sh)

# help section
help()
{
echo
echo "Commit changes and add/delete files to subversion repository"
echo "usage: $cmd"
echo
}

if [ "$1" == "--help" ] ; then
  echo
  help
  echo
  exit 0
fi

# Check dir to operate.
if [ $# -eq 1 ]; then
  dir=$1
else
  dir=$(pwd)
fi

# create add, delete list
svnstatus=$(svn status ${dir})  # check what changed
    added=$(printf "$svnstatus" | sed -n 's/^[A?] *\(.*\)/\1/p')  # add list
  removed=$(printf "$svnstatus" | sed -n 's/^! *\(.*\)/\1/p')  # remove list

# Trick to run svn add only if x$added is different than "x".
if [ "x$added" != "x" ]
then
    echo adding "$added" to repository
    svn add $added
fi

# Trick to run svn remove only if x$removed is different than "x".
if [ "x$removed" != "x" ]
then
    echo removing "$removed" to repository
    svn remove $removed
fi

svn commit ${dir} -m "auto-commit"
svn up ${dir} # update
