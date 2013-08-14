#!/bin/bash
#
# mac_adress.sh
#
# purpose:  Change mac address.
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  28-Dec-2011
# modified: Mon 18 Jun 2012 11:39:18 AM EDT
#
# obs: Soh para a merda da rede do IO
#

# Toshiba wireless: 8C:A9:82:6A:FB:3E
# Toshiba wire:     B8:70:F4:BC:8A:E3

DELL_wire="00:23:AE:06:9E:A1"
DELL_wireless="00:24:2B:D6:A6:2F"
EeePC_wire="20:CF:30:1A:86:47"
EeePC_wireless="74:F0:6D:4A:C5:EC"
Toshiba_ceres_wired="00:19:d2:32:aa:f9"
Toshiba_ceres_wireless="00:16:d4:8e:ca:03"

dev=wlan0  #eth0

mac=${Toshiba_ceres_wired}

sudo /sbin/ifconfig $dev down
sudo /sbin/ifconfig $dev hw ether $mac
sudo /sbin/ifconfig $dev up
