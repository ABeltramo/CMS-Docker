#! /bin/bash

genfile="$1/gen/GEN"
generatore="$1/gen/generatore.py"
risolutore="$1/sol/sol.py"

mkdir "$1/input"
mkdir "$1/output"
i=0
while read line; do
  case "$line" in 		# Skip
	\#*) continue ;; 	# Comment
      	"") continue ;;		# Empty line
  esac
  echo $i
  python $generatore $line > $1/input/"input${i}.txt"
  cat $1/input/"input${i}.txt" | python $risolutore > $1/output/"output${i}.txt"
  i=$(($i+1))
done < $genfile
