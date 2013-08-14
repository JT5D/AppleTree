#!/bin/bash

# thumb2html
#
# purpose:  create a webpage with thumbnails of a picuter directory
# author:   Filipe P. A. Fernandes
# e-mail:   ocefpaf@gmail.com
# web:      http://ocefpaf.tiddlyspot.com/
# date:     28-Feb-09
# modified: 24-Nov-09
#
# obs: added some layout changes and dependencies check
# source: http://www.dicas-l.com.br/cantinhodoshell/cantinhodoshell_20070215.php
#

# check dependencies
commds=( convert )
for commd in ${commds[@]}; do
  if [[ -z $( type -p ${commd} ) ]]; then
    echo -e "${commd} -- NOT INSTALLED !"
    exit 1
  fi
done

  i=0
  thumbssuffix="thumbs"
    thumbspage="thumbs.html"
     thumbsdir="thumbs"
      pagename="Página de miniaturas"
         force=
  
  while getopts 'hn:p:d:s:f' OPT_LETRA
  do
    case $OPT_LETRA in
       'h') echo "SCRIPT para geração de páginas de thumbanils"
          echo
          echo "thumbs_gen [OPÇÕES]"
          echo
          echo "Opções:"
          echo
          echo "-h               retorna essa mensagem de erro"
          echo "-n [nome_pagina] cabeçalho da página de miniaturas"
          echo "-p [arq_pagina]  nome do arquivo da página"
          echo "-d [dir_thumbs]  diretório onde ficarão as miniaturas das"
          echo "                 imagens do diretorio"
          echo "-s [sufixo]      sufixo a ser adicionado ao nome das miniaturas"
          
          echo "-f               sobrescreve arquivos e diretórios existentes"
          exit 0
          ;;
       'n') pagename=$OPTARG
          ;;
       'd') thumbsdir=$OPTARG
          ;;
       's') thumbssufix=$OPTARG
          ;;
       'p') thumbspage=$OPTARG
          ;;
       'f') force="1"
    esac
  done
  
  cabecalho="
  <HTML>
  <HEAD>
  <TITLE>
  $pagename
  </TITLE>
  <BODY>
  <TABLE width=100%>
  <TR>
  <H1>$pagename</H1>
  "
  
  if [ ! -d "$thumbsdir" ] 
  then
    mkdir $thumbsdir
  else
    if [ -z "$force" ] 
    then
        echo "Atenção: Diretório de thumbnails existe! Saindo..."
        exit 1
    fi
  fi
  
  if [ -f "$thumbspage" -a -z "$force" ]
  then
    echo "Atenção: Arquivo HTML da galeria existe! Saindo..."
    exit 1
  fi
  
  echo $cabecalho > $thumbspage
  
  for file in `ls | grep -E -e '(gif|jpg|png|bmp)'`; do
      mainfile=`echo $file | cut -d. -f1`
      thumbfile="${thumbsdir}/${mainfile}_${thumbssuffix}.jpg"
      convert -scale 300x200 $file $thumbfile
      case $i in
          0)
              linha="
              </tr>
              <tr>
              <td>
              <a href='$file'>
              <img src='$thumbfile'>
              </a>
              </td>"
              echo $linha >> $thumbspage
              i=1
              ;;
          1) 
              linha="
              <td>
              <a href='$file'>
              <img src='$thumbfile'>
              </a>
              </td>"
              echo $linha >> $thumbspage
              i=0
              ;;
       esac
  done
  
  rodape='
  </TR>
  </TABLE>
  </HTML>'
  
  echo $rodape >> $thumbspage