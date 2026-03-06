#!/bin/sh

# Dependencies
#
#
usage(){
  echo "[OPTION] [FILE]"
  echo "OPTIONS:"
  echo "--words"
  echo "--plaintext"
  echo "--no-bf"
  echo "--no-it"
}

file=$2
plain=$(sed 's/%.*//;s/\\textcite{//g;s/\\parencite{//g;s/\\cite{//g;s/\\textbf{//g;s/\\textit{//g;s/}//g;s/\\*//g' $file)
case $1 in
  "--words") echo $plain | wc -w;;
  "--plaintext") echo $plain > "plain-$file";;
  "--no-bf") sed 's/\\textbf//g' $file > "no-bf-$file";;
  "--no-it") sed 's/\\textit//g' $file > "no-it-$file";;
    *) usage;;
esac
