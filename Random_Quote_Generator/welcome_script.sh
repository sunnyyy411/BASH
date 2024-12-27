#! /bin/bash

REDCOLOR="\e[31m"
NOCOLOR="\e[0m"
QUOTECOLOR="\e[1;34m"
WELCOMECOLOR="\e[33m"
i=0
while read -r line 
do 
  arr[$i]=$line
  i=$((i+1))
done < /home/kali/quotes.txt

random=$((RANDOM%i))

echo -e "${REDCOLOR}-------------------------------------------------------------------------------------------------"
echo -e "${WELCOMECOLOR}===================================== WELCOME BACK '$(whoami)'!====================================="
echo -e "${QUOTECOLOR}${arr[$random]}\n"
echo -e "${REDCOLOR}-------------------------------------------------------------------------------------------------"
