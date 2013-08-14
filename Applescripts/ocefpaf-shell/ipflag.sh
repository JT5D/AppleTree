#!/bin/bash
#
# ipflag.sh
#
# purpose:  find IP address geographical location
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  06-Oct-2010
# modified: Wed 06 Oct 2010 12:22:28 PM EDT
#
# obs: based on http://www.commandlinefu.com
#

# check dependencies
commds=( lynx )
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
echo "find ip geographical location"
echo "usage: $cmd ip address"
echo
}

if [ "$1" == "--help" ] ; then
  echo
  help
  echo
  exit 0
fi

# input check
if [ $# -eq 1 ]; then
  IP=$1
else
  echo
  echo "error in $cmd"
  echo
  help
  echo
  exit 1
fi

lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=${IP}|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\'
