#!/bin/bash
#
# rename: Busca e move arquivos renomeando-os conforme a máscara
# Criado por: Marcio Gil Maldonado
#

cmd=`basename $0`

if [ "$1" == "--help" ] ; then
  echo "Busca e move arquivos renomeando-os conforme a máscara"
  echo
  echo "Uso:"
  echo "  $cmd [opções] [caminho1/]máscara1 [caminho2/]máscara2"
  echo "  $cmd [opções] --sed 'expr' [caminho/]máscara"
  echo
  echo "Opções:"
  echo "  --test    Não move/renomeia, apenas mostra o que será feito"
  echo "  --cmd mv  Determina o comando para mover/renomear e zera as opções"
  echo "  --sed exp Determina uma expressão \"sed\" no lugar de \"máscara2\""
  echo "  --recursive,"
  echo "  -R,-r     Buscar arquivos no diretório e subdiretórios de origem"
  echo "  -*        Outras opções são repassadas ao comando \"mv\" (-vb implícito)"
  echo
  echo "Exemplos:"
  echo "  $cmd \\*.*~ \\*.bak"
  echo "  $cmd '*.*~' '*.bak'"
  echo "  $cmd \"*.*~\" \"*.bak\""
  echo "  $cmd --sed 's/\..*~$/.bak/' \\*.*~"
  echo
  exit 0
fi

# Tratamento dos parâmetros

istest="0"
mvcmd="mv"
mvopt="-vb"
maxdepth="-maxdepth 1"
sedexpr=""
oldname=""
newname=""

while [ $# -gt 0 ] ; do
  case "$1" in
    --test) istest="1" ;;
    --cmd)  mvcmd="$2" ; mvopt="" ; shift ;;
    --sed)  sedexpr="$2" ; shift ;;
    --recursive|-R|-r) maxdepth="" ;;
    -*)     mvopt="$mvopt $1" ;;
    *)
    if [ -z "$oldname" ] ; then
      oldname="$1"
    elif [ -z "$newname" -a -z "$sedexpr" ] ; then
      newname="$1"
    else
      echo "$cmd: Excesso de parâmetros: $1" >&2
      echo "$cmd: Execute '$cmd --help' para mais informações." >&2
      exit 1
    fi
  esac
  shift
done

if [ -z "$oldname" ] ; then
  echo "$cmd: Máscara de origem não informado" >&2
  echo "$cmd: Execute '$cmd --help' para mais informações." >&2
  exit 1
fi
if [ -z "$newname" -a -z "$sedexpr" ] ; then
  echo "$cmd: Máscara de destino não informado" >&2
  echo "$cmd: Execute '$cmd --help' para mais informações." >&2
  exit 1
fi

patt=`basename "$oldname"`
if [ "$oldname" == "$patt" ] ; then
  mvdir="."
else
  mvdir=`dirname "$oldname"`
  oldname="$patt"
fi

patt=`basename "$newname"`
if [ "$newname" == "$patt" ] ; then
  mvdst="$mvdir"
else
  mvdst=`dirname "$newname"`
  newname="$patt"
fi

# Montagem da expressão 'sed'

if [ -z "$sedexpr" ] ; then
  oldpatt=`echo -n "$oldname" | sed -e 's/[^*?]*\([*?]\?\)[^*?]*/\1/g'`
  newpatt=`echo -n "$newname" | sed -e 's/[^*?]*\([*?]\?\)[^*?]*/\1/g'`

  if [ "$newpatt" != "$oldpatt" ] ; then
    op=`echo -n "$oldpatt" | wc -m`
    np=`echo -n "$newpatt" | wc -m`
    if (( $op < $np || $np == 0 )) ; then
      echo "$cmd: As máscaras de origem e destino são incompatíveis" >&2
      echo "$cmd: Execute '$cmd --help' para mais informações." >&2
      exit 1
    fi
  fi

  oldpatt=`echo -n "$oldname" | sed -e 's/[.]/\\\\./g;s#/#\\\\/#g' \
                                    -e 's/[*]/\\\\(.*\\\\)/g;s/\([?]\)/\\\\(.\\\\)/g'`
  newpatt=`echo -n "$newname" | sed -e 's/[.]/\\./g;s#/#\\/#g'`

  np="1"
  while : ; do
    patt=`echo -n "$newpatt" | sed -e "s/[*?]/\\\\\\\\$np/"`
    if [ "$newpatt" == "$patt" ] ; then
      break
    fi
    newpatt="$patt"
    np=$(( $np + 1 ))
  done

  sedexpr="s/$oldpatt/$newpatt/"
fi

# Efetua/exibe as operações

for f in `find "$mvdir" $maxdepth -name "$oldname"` ; do
  g=`echo -n "$f" | sed "s#^$mvdir##" | sed "$sedexpr"`
  if (( $istest )) ; then
    echo "$mvcmd" "$mvopt" "$f" "$mvdst$g"
  else
    "$mvcmd" "$mvopt" "$f" "$mvdst$g"
  fi
done

# End of rename
