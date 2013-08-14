#!/bin/bash

# version_control_update.sh
#
# purpose:  Update all version controlled repositories
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     22-Dec-2009
# modified: Tue 15 Jan 2013 11:51:22 AM BRST
#
# obs: Some are read only.
#

# Check dependencies.
commds=( svn hg git )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

mat=${HOME}/Dropbox/REPOS
python=${HOME}/Dropbox/pymodules
roms=${HOME}/OcFis/ocean_softs/ROMS

dirs=(
      ${mat}/ocefpaf-matlab
      ${HOME}/Dropbox/REPOS/ocefpaf-shell
     )

for dir in ${dirs[@]}; do
        echo ----------------------------------
        echo "checking ${dir}"
        pushd ${dir}
        status=$(hg pull --update | tail -1)
        echo "$status"
        popd
done


if [ $USER == filipe ]; then
  # SUBVERSION REPOS.
  dirs=(
    ${mat}/mat-svn-toolboxes/guillaumemaze
    ${mat}/mat-svn-toolboxes/imos-toolbox
    ${mat}/mat-svn-toolboxes/matlab_arango
    ${mat}/mat-svn-toolboxes/matlab_wilkin
    ${mat}/mat-svn-toolboxes/mirone
    ${mat}/mat-svn-toolboxes/miyoshi
    ${mat}/mat-svn-toolboxes/netcdf_toolbox
    ${mat}/mat-svn-toolboxes/mexnc
    ${mat}/mat-svn-toolboxes/snctools
    ${roms}/roms_src
    # Dead links. 
    #${mat}/mat-svn-toolboxes/t_tide
    #${mat}/mat-svn-toolboxes/wafo
    #${mat}/mat-svn-toolboxes/njToolbox-2.0
    #${mat}/mat-svn-toolboxes/CMGmfiles
    #${mat}/mat-svn-toolboxes/RPSstuff
    #${mat}/mat-svn-toolboxes/air_sea
    #${mat}/mat-svn-toolboxes/cmglib
    #${mat}/mat-svn-toolboxes/rdadcp
    #${mat}/mat-svn-toolboxes/rslice
    #${mat}/mat-svn-toolboxes/seagrid
    #${mat}/mat-svn-toolboxes/seawater
    #${mat}/mat-svn-toolboxes/tidal_ellipse
    )

  for dir in ${dirs[@]}; do
      echo ----------------------------------
      echo "updating ${dir}"
      svn up ${dir}
  done


  # MERCURIAL REPOS.
  dirs=(
    ${python}/python-airsea
    ${python}/python-ocefpaf
    ${python}/python-oceans
    ${python}/python-gsw
      )

  for dir in ${dirs[@]}; do
      echo ----------------------------------
      echo "checking ${dir}"
      pushd ${dir}
      status=$(hg pull --update | tail -1)
      echo "$status"
      popd
  done

  # GIT repositories ("git pull" does a "git fetch" followed by a "git merge".)
  dirs=(
    ${HOME}/Doutorado
    ${HOME}/linux
      )

  for dir in ${dirs[@]}; do
      echo ----------------------------------
      echo "checking ${dir}"
      pushd ${dir}
      status=$(git pull)
      echo "$status"
      popd
  done
fi
