#!/bin/bash
 
# firewall
#
# purpose:  2-line iptables firewall
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     28-Feb-09
# modified: 24-Nov-09
#
# obs: /etc/init.d/firewall start (stop)
#  add to /etc/init.d/boot.local
#  source: http://www.gdhpress.com.br/redeseservidores/leia/index.php?p=cap11-2
#

# check dependencies
commds=( /usr/sbin/iptables )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
else
    /usr/sbin/iptables -A INPUT -i lo -j ACCEPT
    /usr/sbin/iptables -A INPUT -p tcp --syn -j DROP
fi