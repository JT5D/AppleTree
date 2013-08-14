#!/bin/bash

# 
# twitt
# purpose: 
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     29-Sep-09
# modified: 29-Sep-09
#
# obs: 
#

#!/bin/bash
#
# Programa que post no twitter via curl.
#
# Autor: Denis S. Costa - deniscostadsc@gmail.com
#
# Dependências:
#  - bash;
#  - curl;
#

# Funções
verifica_tweet () {
contador=$(echo $1 | wc -m)

if [ $contador -gt 140 ]; then
        echo "Os tweets só podem ter até 140 caracteres!"
        echo "Seu tweet possui $contador caracteres!!!"
        exit 1
fi
}

verifica_login () {
if [ ! $1 ]; then
        echo "Digite login/senha"
        exit 1
fi
}

# Programa principal
read -p    "Tweet: "   tweet
verifica_tweet "$tweet"
read -p    "Usuario: " usuario
verifica_login "$usuario"
read -s -p "Senha: "   senha
verifica_login "$senha"

echo ""

curl -u $usuario:$senha -d status="$tweet" \ 
http://twitter.com/statuses/update.xml > /dev/null 2>&1
