#! /bin/bash

genfile="$1/gen/GEN"
generatore="$1/gen/generatore.py"
risolutore="$1/sol/soluzione.cpp"
testo="$1/testo/testo.tex"

mkdir "$1/input"
mkdir "$1/output"
i=0
g++ $risolutore -o $1/sol/soluzione
while read line; do
  case "$line" in 		  # Skip
	\#*) continue ;; 	    # Comment
      	"") continue ;; # Empty line
  esac
  echo $i
  python $generatore $line > $1/input/"input${i}.txt"
  cat $1/input/"input${i}.txt" | $1/sol/soluzione > $1/output/"output${i}.txt"
  i=$(($i+1))
done < $genfile

# Compile pdf in folder testo
pdflatex -output-directory $1/testo $testo
