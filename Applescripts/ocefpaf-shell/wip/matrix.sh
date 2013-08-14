#!/bin/bash
  
  trap "echo -e '\033[m0';clear;setterm -cursor on;exit" 2
  
  setterm -cursor off
  
  Chars="abcdefghijklmnopqrstuvxywzABCDEFGHIJKLMNOPQRSTUVXYWZ01234567890!@#$%¨&*()_-+=^~{}[];:?"
  clear
  while true; do
  lin=0
  [ ${#Cols[@]} -eq $(($(tput cols)-2)) ] && unset Cols
  while true; do
  COL=$((RANDOM%$(tput cols)))
  [ "${Cols[$COL]}" ] && continue
  Cols[$COL]=1
  break
  done
  COR="\e[3$((RANDOM%7+1));1m"
  while [ $lin -lt $(tput lines) ]; do
  Char=$(echo $Chars | cut -c$((RANDOM%86+1)))
  for i in `seq 1 5`;do
  Char1=$(echo $Chars | cut -c$i);sleep 0.000001
  tput cup $lin $COL; echo -en "\e[37;1m$Char1"
  done
  tput cup $lin $COL; echo -en "$COR$Char";sleep 0.0001
  let lin++
  done
  done
