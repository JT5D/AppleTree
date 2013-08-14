#! /bin/sh
#
#   Copyright
#
#	Copyright (C) 2009-2010 Jari Aalto <jari.aalto@cante.net>
#	Copyright (C) 2008 Matthieu Moy <Matthieu.Moy@imag.fr>
#
#   License
#
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 2 of the License, or
#       (at your option) any later version.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#       GNU General Public License for more details
#       at <http://www.gnu.org/licenses/>.

[ "$debug" ] && set -x

PROGRAM=$(basename $0)
prg=diff

if [ -x /opt/csw/bin/gdiff ]; then 			# SUN/OS Solaris
    prg=/opt/csw/bin/gdiff
fi

DIFF_PROGRAM=${DIFF_PROGRAM:-$prg}

Warn ()
{
    echo "$*" >&2
}

Die ()
{
    Warn "$PROGRAM: [ERROR] $*"
    exit 1
}

usage ()
{
    echo "\
NAME
    $PROGRAM - Diff Open Document files

SYNOPSIS
    [debug=1] $PROGRAM [options] FILE1 [FILE2]

DESCRIPTION
   Show difference of openoffice documents as plain text ASCII.
   If FILE2 is not provided, $PROGRAM will search for an svn base
   file, and show the diff against the last commited version in SVN.

   Depends on program odt2txt being installed.

OPTIONS
    Options are same as in diff(1) command.

    If variable 'debug' exists in environment, the program is run
    with shell \"set -x\" option.

EXAMPLES

    To use form command line:

        oodiff file-v1.odt file-v2.odt

    To use from Git:

        [debug=1] GIT_EXTERNAL_DIFF=oodiff git diff file.odt

AUTHORS
    Original author is Matthieu Moy <Matthieu.Moy@imag.fr>
    Major cleanup by Jari Aalto <jari.aalto@cante.net>

AVAILABILITY
    http://www-verimag.imag.fr/~moy/opendocument/

COPYRIGHT

    License GPL-2+: GNU GPL version 2 or later
    <http://gnu.org/licenses/gpl.html>. This is free software: you
    are free to change and redistribute it. There is NO WARRANTY,
    to the extent permitted by law.

SEE ALSO
    odt2txt(1)"
}

clean_up ()
{
    [ "$ft1" ] && rm -f "$ft1"
    [ "$ft2" ] && rm -f "$ft2"
}

Main ()
{
    file1=""
    file2=""

    while test $# -ne 0; do
	case "$1" in
	    --help|-h)
		usage
		exit 0
		;;
	    -*)
		opts="$opts $1"
		;;
	    *)
		if [ ! "$file1" ]; then
		    file1=$1
		elif [ ! "$file2" ]; then
		    file2=$1
		else
		    usage
		    exit 1
		fi
		;;
	esac
	shift
    done

    if [ ! "$file1" ]; then
	Die "missing FILE1 argument."
    fi

    svnfile="$(dirname "$file1")/.svn/text-base/${file1##*/}.svn-base"

    if [ ! "$file2" ]; then
        if [ -f "$svnfile" ]; then
	    file2="$file1"
	    file1="$svnfile"
        else
	    Die "missing FILE2 argument" \
		"(tried SVN base file, but it doesn't exist: $svnfile)"
        fi
    fi

    if [ -d "$file1" ]; then
	# Be recursive.
	# echo "entering $file1"
	for file in "$file1"/*
	do
	    "$0" $opts "$file" $(echo "$file" | sed "s@^$file1/@$file2/@")
	done

    else
	ft1=$(mktemp /tmp/oodiff.$$.1.XXXXXXXXXX) \
	    || ft1="/tmp/oodiff.$$.1"

	ft2=$(mktemp /tmp/oodiff.$$.2.XXXXXXXXXX) \
	    || ft2="/tmp/oodiff.$$.2"

	trap 'clean_up; exit 0' 1 2 3 15

	if odt2txt "$file1" > "$ft1" 2>/dev/null && \
	   odt2txt "$file2" > "$ft2" 2>/dev/null
	then

	    if $DIFF_PROGRAM -L "$file1" -L "$file2" $opts "$ft1" "$ft2"
	    then
		# no text change
		if diff -q "$file1" "$file2"; then
		    : # no change at all
		else
		    echo "OpenDocument files $file1 and $file2 files differ" \
			 "(same text content)"
		fi
	    fi
	else
	    $DIFF_PROGRAM $opts "$file1" "$file2"
	fi

	clean_up
    fi
}

Main "$@"

# End of file
