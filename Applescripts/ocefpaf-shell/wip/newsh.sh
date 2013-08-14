#!/bin/bash

# newsh
#
# purpose:  new shell script
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     15-Mar-09
# modified: 24-Nov-09
#
# obs: kate is not a real dependencies, any test editor can be used
#

# check dependencies
commds=( kate )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

#input check
if [ $# -eq 1 ]; then
  filename=$1   # filename
else
  echo "________________________________________________________________"
  echo
  echo "error in $0"
  echo
  echo "type $cmd --help for info"
  echo "________________________________________________________________"
  exit 1
fi

# help section
cmd=$(basename $0) # get script name

if [ "$1" == "--help" ] ; then
  echo "create new shell script"
  echo
  echo "usage: $cmd shell_script_name.sh"
  echo
  exit 2
fi

if [ -e "$filename" ]; then
  echo
  echo "$filename exists"
  echo
  exit 1
fi

# text menu
echo '
1) create script, do not open file
2) create script, open file with kate 
1 or 2'
read resp

# define filename
if [ -n "$1" ]; then
  filename=$1
else
  filename=filename
fi

# header info
data=`date +%d-%b-%y`
autor="Filipe P. A. Fernandes"
email="ocefpaf@gmail.com"
web="http://ocefpaf.tiddlyspot.com/"

# make header
echo "#!/bin/bash

# $(basename $filename .sh)
#
# purpose:  
# author:   $autor
# e-mail:   $email
# web:      $web
# date:     $data
# modified: $data
#
# obs: 
#

# check dependencies
commds=( comando )
for commd in \${commds[@]}; do
  if [[ -z \$( type -p \${commd} ) ]]; then
    echo -e \"\${commd} -- NOT INSTALLED !\"
    exit 1
  fi
done

# help section
cmd=\$(basename \$0) # get script name

if [ \"\$1\" == \"--help\" ] ; then
  echo \" describe use\"
  echo
  echo \"usage: \$cmd [options, syntaxe] \"
  echo
  exit 0
fi

# input check
if [ \$# -eq x ]; then
  var1=\$1
  var2=\$2
else
  echo \"________________________________________________________________\"
  echo
  echo \"error in \$cmd\"
  echo
  echo \"type \$cmd --help for info\"
  echo \"________________________________________________________________\"
  exit 1
fi

" > $filename

# make it executable
chmod +x $filename 

# check answer from menu
if [ "$resp" = "1" ]; then
  exit 0
elif [ "$resp" = "2" ]; then
  kate $filename 1> /dev/null 2> /dev/null &
fi
