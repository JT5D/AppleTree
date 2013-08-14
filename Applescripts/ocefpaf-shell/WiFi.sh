#!/bin/bash
#
# WiFi.sh
#
# purpose:
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail
# web:      http://ocefpaf.tiddlyspot.com/
# created:  15-Apr-2013
# modified: Mon 15 Apr 2013 09:18:05 AM BRT
#
# obs:
#

ifconfig=/sbin/ifconfig
iwconfig=/usr/sbin/iwconfig

if [ $($ifconfig en0 | grep UP | wc -l) -eq 1 ]; then
    qual="$($iwconfig wlan0 | grep Quality | cut -d'=' -f2 | cut -d' ' -f1 | cut -d'/' -f1)"

    if [ $qual -gt 52 ]; then  # >75% link quality.
        sparked=$(spark 1 2 3 4)
    elif [ $qual -gt 35 ]; then  # >50% link quality.
        sparked=$(spark 1 2 3 0)
    elif [ $qual -gt 17 ]; then  # 25% link quality.
        sparked=$(spark 1 2 0 0)
    elif [ $qual -gt 7 ]; then  # 25% link quality.
        sparked=$(spark 1 0 0 0)
    else  # < 25%.
        sparked=$(spark 0 0 0 0)
    fi
    echo $sparked
fi
