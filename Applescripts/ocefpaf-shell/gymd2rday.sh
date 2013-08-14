#!/bin/bash

#
#   gymd2rday - Gregorian calendar date to "Rata Die day number"
#
# SYNOPSIS
#
#   gymd2rday [YEAR MON DAY]
#
# DESCRIPTION
#
#   Converts Gregorian calendar date (year, month, day) to the corresponding
#   number of whole days since 0001-01-01 00:00:00.  If no arguments are given,
#   the current date and time is used.
#
#   The algorithm is carefully designed to utilize the full range of the shell
#   integer type (see LIMITATIONS).
#
# LIMITATIONS
#
#   In shells whose integer type is a 32 bit unsigned integer, the valid range
#   is
#
#      Input (year, mon, day)   Output (day)
#      -5879610 6 23            -2147483648
#       5879611 7 12             2147483647
#
#   In shells whose integer type is a 64 bit unsigned integer, the valid range
#   is
#
#      Input (year, mon, day)       Output (day)
#      -25252734927766554 6 7       -9223372036854775808
#       25252734927766555 7 28       9223372036854775807
#
# AUTHOR
#
#   Author:      Peter J. Acklam
#   Time-stamp:  2006-05-08 10:55:00 +02:00
#   E-mail:      pjacklam@online.no
#   URL:         http://home.online.no/~pjacklam

gymd2rday () {

    if (( $# == 0 )); then
        set -- $( date '+%Y %m %d' )
    elif (( $# != 3 )); then
        echo "Usage: $0 [YEAR MON DAY]" 1>&2
        exit 2
    fi

    typeset -i year mon day a j i y m days

    year=10#$1
    mon=10#$2
    day=10#$3

    # `a' is 1 if the month is January or February and 0 otherwise.
    a=$(( ( 14 - mon )/12 ))

    # Remove a multiple of 400 years.  This is convenient since the leap year cycle
    # repeats itself every 400 years.  The variable `j' is the number of 400 year
    # periods that we removed, and `i' is the "adjusted" year number.  We will
    # later compensate for the multiple of 400 years that we removed.  Note that by
    # removing one extra 400 year period, we make sure `i' is always positive.
    j=$(( year/400 - 1 ))
    i=$(( year - 400*j ))

    # Create a new variable `y' which is `i' adjusted so that the years begin at
    # --03-01 rather than --01-01.  The algorithm requires that `y' is
    # non-negative, but since `i' is a number in [1,799] then `y' will be in the
    # range [0,798], so we're safe.
    y=$(( i - a ))

    # Compute the number of months since the most recent --03-01.
    m=$(( mon + 12*a - 3 ))

    # Compute the day number by adding
    #   1) the day of the month
    #   2) the days in the months since the most recent --03-01
    #   3) the days in the whole years since 0000-03-01 ignoring leap days
    #   4) the leap days
    #   5) the number of days from 0000-03-01 to 0001-01-01 minus one, since the
    #      day number should be zero on 0001-01-01
    #   6) the days in the 400-year periods that was removed initially
## modifyied by Filipe to adjust the 1 day offset ##
    days=$(( day + ( 153*m + 2 )/5 + y*365 + y/4 - y/100 + y/400 - 305 + 146097*j ))
#     days=$(( day + ( 153*m + 2 )/5 + y*365 + y/4 - y/100 + y/400 - 306 + 146097*j ))

    echo $days

    return 0
}

if (( $# )); then
    gymd2rday "$@"
else
    if [[ -t 0 ]]; then
        gymd2rday
    else
        while read line; do
            gymd2rday $line
        done
    fi
fi