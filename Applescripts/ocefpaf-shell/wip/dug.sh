#!/bin/bash
#DESCRICAO: dug.sh => Grafico do uso de um diretorio
# sintaxe:
#         use: ~/dug.sh [diretorio/ [nro_itens]]
# onde:
#         diretorio e' onde deve ser executado o du e nro_itens e' qdo um diretorio
#         com muitos itens (subdiretorio) pode se optar por exibir os 10 maiores.

vtmp=/tmp/x$$.1
ltmp=/tmp/x$$.2
xtmp=/tmp/x$$.3

[ "$1" = "" ] && dir="./" || dir="$1"
[ "$2" = "" ] && mai=15 || mai=$2

fracao_tamanho() {
[ $(echo "$v > 1000" | bc -l) -eq 1 ] && \
v=$(echo "scale=2; $v/1000" | bc -l) && \
b="Mb"
[ $(echo "$v > 1000" | bc -l) -eq 1 ] && \
v=$(echo "scale=2; $v/1000" | bc -l) && \
b="Gb"
[ $(echo "$v > 1000" | bc -l) -eq 1 ] && \
v=$(echo "scale=2; $v/1000" | bc -l) && \
b="Tb"
}

echo "consultado diretorios de $dir ..."
du --max-depth=1 $dir 2>/dev/null | sort -n | tail -n $mai > $xtmp
cem=$(tail -n 1 $xtmp | awk '{print $1}')
v=$cem  ; b="Kb"
fracao_tamanho
tit="Uso+de+$dir:${v}$b"
egrep -v ^0 $xtmp | \
while read a ; do
      v=$(echo $a | awk '{print $1}') ; b="Kb"
      c=$(echo "scale=2; $v*100/$cem" | bc -s)
      fracao_tamanho

      # os echo's dvem ir aqui para nao incluir a ultima linha
      echo "$l2" > $ltmp
      echo "$v2" > $vtmp
      l="$(echo $a | awk '{print $2}')($c%+${v}$b)"
      [ "$l2" = "" ] && l2="$l" || l2="$l2|$l"
      [ "$v2" = "" ] && v2="$c" || v2="$v2,$c"
done
uso=$(cat $vtmp)
leg=$(cat $ltmp)
rm $vtmp $ltmp $xtmp
url="http://chart.apis.google.com/chart?chs=700x300&cht=p&chd=t:$uso&chl=$leg&chtt=$tit"
#firefox "$url"
wget "$url" -O $xtmp.jpg 2>/dev/null
#visualizador="firefox"
visualizador="display"
[ -f $xtmp.jpg ] && $visualizador $xtmp.jpg || echo "Nao gerou o grafico!"
rm $xtmp.jpg
exit 0
