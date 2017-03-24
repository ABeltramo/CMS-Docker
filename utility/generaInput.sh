#! /bin/bash

genfile="$1/gen/GEN"
generatore="python $1/gen/generatore.py"
risolutoreFile="$1/sol/soluzione.cpp"
risolutore="$1/sol/soluzione"
testo="$1/testo/testo.tex"

mkdir "$1/input"
mkdir "$1/output"
i=0
g++ -std=c++11 $risolutoreFile -o $1/sol/soluzione
while read line; do
  case "$line" in 		  # Skip
	\#*) continue ;; 	    # Comment
      	"") continue ;; # Empty line
  esac
  echo $i
  $generatore $line > $1/input/"input${i}.txt"
  cat $1/input/"input${i}.txt" | $risolutore > $1/output/"output${i}.txt"
  i=$(($i+1))
done < $genfile

# Compile pdf in folder testo
pdflatex -output-directory $1/testo $testo > $1/testo/consoleLog
echo "DONE!"
