#!/usr/bin/env bash

# open in background redirecting stdout to null
function VirtualBox() { command VirtualBox "$@" > /dev/null 2>&1 & }
function dolphin()    { command dolphin    "$@" > /dev/null 2>&1 & }
function firefox()    { command firefox    "$@" > /dev/null 2>&1 & }
function gimp()       { command gimp       "$@" > /dev/null 2>&1 & }
function gwenview()   { command gwenview   "$@" > /dev/null 2>&1 & }
function inkscape()   { command inkscape   "$@" > /dev/null 2>&1 & }
function kile()       { command kile       "$@" > /dev/null 2>&1 & }
function kn()         { command kate --new "$@" > /dev/null 2>&1 & }
function kt()         { command kate       "$@" > /dev/null 2>&1 & }
function kwrite()     { command kwrite     "$@" > /dev/null 2>&1 & }
function ok()         { command okular     "$@" > /dev/null 2>&1 & }
function smp()        { command optirun smplayer "$@" > /dev/null 2>&1 & }

function dusk()
{
du -skch * |sort -rn | awk '/total/{ total=$0;next; } {print $0} END {print total;}'
}
function ff() { find . -type f -iname '*'$*'*'; }

function miso()
{
    sudo mkdir /media/iso
    sudo mount -t iso9660 -o loop "$@" /media/iso
}

function uiso()
{
    sudo umount /media/iso && \
    sudo rm -rf /media/iso/
}

function pyrep-html()
{
pyreport --silent --latexliterals --type=html --outfile=$(basename "$1" .py) "$1"
}

function pyrep-pdf()
{
pyreport --silent --latexliterals --type=pdf --outfile=$(basename "$1" .py) "$1"
}

function msword()
{
env WINEPREFIX="$HOME/.wine" wine C:\\windows\\command\\start.exe /Unix $HOME/.wine/dosdevices/c:/users/$USER/Start\ Menu/Programs/Microsoft\ Office/Microsoft\ Office\ Word\ 2007.lnk > /dev/null 2>&1 &
}

function extract() # handy extraction
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1   ;;
             *.tar.gz)    tar xvzf $1   ;;
             *.tar.lzma)  tar xJvf $1   ;;
             *lzma)       lzma --decompress --verbose $1   ;;
             *.bz2)       bunzip2 $1    ;;
             *.rar)       unrar x $1    ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xvf $1    ;;
             *.tbz2)      tar xvjf $1   ;;
             *.tgz)       tar xvzf $1   ;;
             *.zip)       unzip $1      ;;
             *.Z)         uncompress $1 ;;
             *.7z)        7z x $1       ;;
             *.rpm)       unrpm -v $1   ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

function svg2png()
{
rsvg-convert --dpi-x=150 --dpi-y=150 "$1" -o $(basename "$1" .svg).png
}


function empty()
{
    trash-list
    if yesno --timeout 15 --default no "Clean these files? [yes/no] "; then
        /usr/bin/trash-empty
    else
        echo "Clean your trash later..."
    fi
}

#####################################################################
# Ask yesno question.
#
# Usage: yesno OPTIONS QUESTION
#
#   Options:
#     --timeout N    Timeout if no input seen in N seconds.
#     --default ANS  Use ANS as the default answer on timeout or
#                    if an empty answer is provided.
#
# Exit status is the answer.

function yesno()
{
    local ans
    local ok=0
    local timeout=0
    local default
    local t

    while [[ "$1" ]]
    do
        case "$1" in
        --default)
            shift
            default=$1
            if [[ ! "$default" ]]; then error "Missing default value"; fi
            t=$(tr '[:upper:]' '[:lower:]' <<<$default)

            if [[ "$t" != 'y'  &&  "$t" != 'yes'  &&  "$t" != 'n'  &&  "$t" != 'no' ]]; then
                error "Illegal default answer: $default"
            fi
            default=$t
            shift
            ;;

        --timeout)
            shift
            timeout=$1
            if [[ ! "$timeout" ]]; then error "Missing timeout value"; fi
            if [[ ! "$timeout" =~ ^[0-9][0-9]*$ ]]; then error "Illegal timeout value: $timeout"; fi
            shift
            ;;

        -*)
            error "Unrecognized option: $1"
            ;;

        *)
            break
            ;;
        esac
    done

    if [[ $timeout -ne 0  &&  ! "$default" ]]; then
        error "Non-zero timeout requires a default answer"
    fi

    if [[ ! "$*" ]]; then error "Missing question"; fi

    while [[ $ok -eq 0 ]]
    do
        if [[ $timeout -ne 0 ]]; then
            if ! read -t $timeout -p "$*" ans; then
                ans=$default
            else
                # Turn off timeout if answer entered.
                timeout=0
                if [[ ! "$ans" ]]; then ans=$default; fi
            fi
        else
            read -p "$*" ans
            if [[ ! "$ans" ]]; then
                ans=$default
            else
                ans=$(tr '[:upper:]' '[:lower:]' <<<$ans)
            fi 
        fi

        if [[ "$ans" == 'y'  ||  "$ans" == 'yes'  ||  "$ans" == 'n'  ||  "$ans" == 'no' ]]; then
            ok=1
        fi

        if [[ $ok -eq 0 ]]; then warning "Valid answers are: yes y no n"; fi
    done
    [[ "$ans" = "y" || "$ans" == "yes" ]]
}
