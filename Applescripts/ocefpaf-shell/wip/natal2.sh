#!/bin/bash
# Versão 2009
trap "tput reset; tput cnorm; exit" 2
clear
tput civis
lin=2
col=$(($(tput cols) / 2))
c=$((col-1))
est=$((c-2))
cor=0
tput setaf 2; tput bold
                 # Montando a Árvore
for ((i=1; i<20; i+=2))
{
    tput cup $lin $col
    for ((j=1; j<=i; j++))
    {
        echo -n \*
    }
    let lin++
    let col--
}
tput sgr0; tput setaf 3
for ((i=1; i<=2; i++))
{
    tput cup $((lin++)) $c
    echo 'mWm'
}
tput setaf 1; tput bold
tput cup $lin $((c - 4)); echo BOAS FESTAS
tput cup $((lin + 1)) $((c - 11)); echo E muito suSHELLso em 2010
let c++
k=1
                   # Pendurando as bolas (da árvore, claro!)
while true; do
    for ((i=1; i<=35; i++))
    {
                   # Apagando a bola que foi ligada há 25 rodadas atras
       [ $k -gt 1 ] && {
            tput setaf 2; tput bold
            tput cup ${linha[$[k-1]$i]} ${coluna[$[k-1]$i]}; echo \*
            unset linha[$[k-1]$i]; unset coluna[$[k-1]$i]  # Mantenha limpo o vetor
            }
        li=$((RANDOM % 9 + 3))
        ini=$((c-li+2))
        fim=$((c+li+2))
        co=$((RANDOM % (li-2) * 2 + 1 + ini))
        tput setaf $cor; tput bold   # Troca cor das bolas
        tput cup $li $co
        echo o
        linha[$k$i]=$li
        coluna[$k$i]=$co
        cor=$(((cor+1)%8))
#        sleep 0.05
        sh=1
        for l in S H E L L
        do
            tput cup $((lin+1)) $((c-3+sh))
            echo $l
            let sh++
            sleep 0.01
        done
    }
    k=$((k % 2 + 1))
done