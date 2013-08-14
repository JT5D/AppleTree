#!/usr/bin/env bash

# Directory.
alias cd....='cd ..;cd ..;cd ..'
alias cd...='cd ..;cd ..'
alias mkdir='mkdir -p'

# Deleting.
#alias path='echo -e ${PATH//:/\\n}'
#alias rm='rm -vi' # using python-trash-cli
alias rm='trash-put --interactive --force --recursive'
#alias trash-empty='echo "stop using that command already! Empty once a day at boot?"'
alias wipe='wipe -ZdntVAkO -S512 -C4096 -l2 -x8 -p5'

# Coping, moving, compressing, and opening files.
alias bznew='bznew -t -v -K'
alias cp='cp --verbose --no-dereference --recursive --interactive --preserve'
alias mv='mv --verbose --interactive'
alias open='xdg-open'

# Call misc programs.
alias AstroMenace='AstroMenace --noAA --dir=/usr/share/games/AstroMenace --mode=12'
alias TeXamator='python ~/TeXamator/TeXamator.py'
alias ltxmk='grep -l '\\documentclass' *tex | xargs latexmk -bibtex -pdf -pvc -silent'
alias rst2pdf='rst2pdf --smart-quotes=1'
alias youtdl='youtube-dl --verbose --continue --no-overwrites --title --max-quality=38'

# Call kate.
alias km='kate *.m > /dev/null 2>&1 &'
alias kpy='kate *.py > /dev/null 2>&1 &'

# Misc.
alias vi="vi -p"
alias DONE="kdialog --msgbox DONE!"
alias sdone="echo DONE | text2wave | aplay > /dev/null 2>&1"
alias cls='clear'
alias df='df -kTh'
alias du='du -kh'
alias grep='grep --color=tty -d skip -i -n'
alias h='history'
alias j='jobs -l'
alias more='less'
alias nsl='netstat -alnp --protocol=inet | grep -v CLOSE_WAIT | cut -c-6,21-94 |  tail +2'
alias whatismyip='curl automation.whatismyip.com/n09230945.asp'

# decode/encode.
alias decode='sudo mount -t ecryptfs $HOME/Documents/docs $HOME/Documents/docs'
alias encode='sudo umount $HOME/Documents/docs'

# Hardware control.
alias eject='sync ; eject'
alias dvdrip='vobcopy -i /dev/dvd/ -o ~/DVDs/ -l'
alias nvidia_sensor='echo "NVIDIA" ; DISPLAY=:0.0 nvidia-settings -q [gpu:0]/GPUCoreTemp | \grep "Attribute" | sed -e "s/.*: //g" -e "s/\.//g"'
#alias sensors='sensors ; nvidia_sensor'
nicemount(){ (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2=$4="";1') | column -t; }
alias pd_info='grep -Ff <(/usr/sbin/hwinfo --disk --short) <(/usr/sbin/hwinfo
--usb --short)'

# ls
alias dir='find . -type d | sed -e "s~[^-][^/]*/~ |~g" -e "s~|\([^ ]\)~|-\1~"'
alias la='ls -Al'               # show hidden files
alias lc='ls -lcr'              # sort by change time
alias lk='ls -lSrh'             # sort by size
alias ll='ls -lh -A --group-directories-first -B'
alias lm='ls -al |more'         # pipe through 'more'
alias lr='ls -lR'               # recursive ls
alias ls='ls -hF --color'       # add colors for filetype recognition
alias lu='ls -lur'              # sort by access time
unalias l  # first un-alias SUSE built-in.

# sort by extension
function l() {
ls -lXB $1 | awk '/total/{ total = $0; next; } {printf "%5s %s %02d %5s %s\n", $5,$6,$7,$8, substr( $0, index($0,$9) ) }  END{print total;}'
}

# sort by date
function lt(){
ls -ltr $1 | awk '/total/{ total = $0; next; } {printf "%4s %s %02d %5s %s\n", $5,$6,$7,$8, substr( $0, index($0,$9) ) }  END{print total;}'
}

# sort by extension
function lx(){
ls -lXB $1 | awk '/total/{ total = $0; next; } {printf "%4s %s %02d %5s %s\n", $5,$6,$7,$8, substr( $0, index($0,$9) ) }  END{print total;}'
}

# Connections.
alias scpresume="rsync --partial --progress --rsh=ssh"
alias ssh2smast='ssh -X -D8080 ffernand@134.88.228.37'
alias ssh2espresso='ssh -X -D8080 filipe@192.168.32.30'
alias ssh2ftp='ssh -p7000 lado@webdof'

function scp2smast()
{
scp -r "$@" ffernand@134.88.228.37:~/.
}
