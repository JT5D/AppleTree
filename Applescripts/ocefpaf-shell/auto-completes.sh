#!/usr/bin/env bash

_ext_ ()
{
    local c=${COMP_WORDS[COMP_CWORD]}
    local a="${COMP_LINE}"
    local e s g=0 cd dc t=""
    local IFS

    shopt -q extglob && g=1
    test $g -eq 0 && shopt -s extglob

    cd='*-?(c)d*'
    dc='*-d?(c)*'

    case "${1##*/}" in
    extract)            e='!*.+(bz2|gz|lzma|rar|tbz2|tgz|zip|Z|7z|rpm|tar)' ;;
    code2html)          e='!*.+(txt|tex|m|py|r|gmt|sh)' ;;
    compile)            e='!*.+(sh)' ;;
    myrpmbuild)         e='!*.+(spec)' ;;
    print)              e='!*.+(pdf|ps)' ;;
    xv)                 e='!*.+(jpg|jpeg|png|gif|tif|tiff|bmp|ps)' ;;
    *)                  e='!*'
    esac

    case "$(complete -p ${1##*/} 2> /dev/null)" in
        *-d*)   ;;
        *) s="-S/"
    esac

    IFS='
'
    case "$c" in
    \$\(*\))       eval COMPREPLY=\(${c}\) ;;
    \$\(*)              COMPREPLY=($(compgen -c -P '$(' -S ')'  -- ${c#??}))    ;;
    \`*\`)         eval COMPREPLY=\(${c}\) ;;
    \`*)                COMPREPLY=($(compgen -c -P '\`' -S '\`' -- ${c#?}))     ;;
    \$\{*\})       eval COMPREPLY=\(${c}\) ;;
    \$\{*)              COMPREPLY=($(compgen -v -P '${' -S '}'  -- ${c#??}))    ;;
    \$*)                COMPREPLY=($(compgen -v -P '$'          -- ${c#?}))     ;;
    \~*/*)              COMPREPLY=($(compgen -f -X "$e"         -- ${c}))       ;;
    \~*)                COMPREPLY=($(compgen -u ${s}            -- ${c}))       ;;
    *@*)                COMPREPLY=($(compgen -A hostname -P '@' -S ':' -- ${c#*@})) ;;
    *[*?[]*)            COMPREPLY=($(compgen -G "${c}"))                        ;;
    *[?*+\!@]\(*\)*)
        if test $g -eq 0 ; then
                        COMPREPLY=($(compgen -f -X "$e" -- $c))
                        test $g -eq 0 && shopt -u extglob
                        return
        fi
                        COMPREPLY=($(compgen -G "${c}"))                        ;;
    *)
        if test "$c" = ".." ; then
                        COMPREPLY=($(compgen -d -X "$e" -S / ${_nosp} -- $c))
        else
                        for s in $(compgen -f -X "$e" -- $c) ; do
                            if test -d $s ; then
                                COMPREPLY=(${COMPREPLY[@]} $(compgen -f -X "$e" -S / -- $s))
                            elif test -z "$t" ; then
                                COMPREPLY=(${COMPREPLY[@]} $s)
                            else
                                case "$(file -b $s 2> /dev/null)" in
                                $t) COMPREPLY=(${COMPREPLY[@]} $s)              ;;
                                esac
                            fi
                        done
        fi                                                                      ;;
    esac
    test $g -eq 0 && shopt -u extglob
}

complete -d -X '.[^./]*' -F _ext_ extract
complete -d -X '.[^./]*' -F _ext_ code2html
complete -d -X '.[^./]*' -F _ext_ compile
complete -d -X '.[^./]*' -F _ext_ myrpmbuild
complete -d -X '.[^./]*' -F _ext_ print
complete -d -X '.[^./]*' -F _ext_ xv

complete -W "-hdd -em -ck -up" update
complete -W "TOSHIBA JU SAT" bkp-home
complete -W "TOSHIBA JU PS2 WII" hdd-eject

complete -W "\
    attrb \
    awk \
    awk1line \
    bind \
    clamav \
    convert \
    curl \
    dict \
    disper \
    ecryptfs \
    fdupes \
    ffmpeg \
    find \
    flvtool2 \
    forloops \
    git \
    googlecl \
    gpg \
    grep \
    hg \
    html \
    identify \
    ipython \
    iso \
    kdocker \
    locate \
    mutt \
    netstat \
    nmap \
    ocropus \
    ooffice \
    osc \
    pdftk \
    ping \
    print \
    python \
    quilt \
    regexpr \
    rest \
    rpm \
    screen \
    sed \
    sed1line \
    sort \
    source \
    sphinx \
    ssh \
    sudo \
    svn \
    tar \
    todo \
    unix \
    vbox \
    videos \
    vim \
    vim-adv \
    vim-basic \
    vim-fold \
    vim-plugins-NERDComment \
    vim-plugins-surround \
    vim-python-snippets \
    vim-tabs virtualev \
    wget \
    wine \
    zenity \
    " examples
