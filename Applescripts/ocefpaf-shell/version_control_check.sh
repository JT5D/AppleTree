#!/bin/bash
#
# version_control_check.sh
#
# purpose:  Check version repositories.
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  24-Nov-2009
# modified: Wed 19 Jun 2013 08:12:47 PM BRT
#
# obs: Perform version control check at all working directories.
#

# Check dependencies.
commds=( hg git )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

# Nice way to pass $0.
cmd=$(basename $0 .sh)

# Help section.
help()
{
echo
echo "Just call from anywhere. The directory list is hard-coded."
echo
}

if [ "$1" == "--help" ] ; then
  echo
  help
  echo
  exit 0
fi


# MERCURIAL repositories.
matlab=$HOME/Dropbox/REPOS
python=$HOME/Dropbox/pymodules

dirs=(
      ${matlab}/ocefpaf-matlab
      ${python}/python-airsea
      ${python}/python-oceans
      ${python}/python-ocefpaf
      ${python}/python-gsw
      ${HOME}/Dropbox/REPOS/ocefpaf-shell
    )

# Just report the status.
# I'm not committing to avoid bad commits log messages.
for dir in ${dirs[@]}; do
        echo ----------------------------------
        echo "checking ${dir}"
        pushd ${dir}
        status=$(hg st)
        echo "$status"
        popd
done

# GIT repositories
dirs=(
      ${HOME}/Doutorado
      ${HOME}/linux
     )

for dir in ${dirs[@]}; do
        echo ----------------------------------
        echo "checking ${dir}"
        pushd ${dir}
        status=$(git status)
        echo "$status"
        popd
done

