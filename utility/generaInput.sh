#! /bin/bash

genfile="$1/gen/GEN"

# CASO 1: generatore in Python
generatore="python $1/gen/generatore.py"
# CASO 2: generatore in CPP
#g++ -std=c++11 $1/gen/generatore.cpp -o $1/gen/generator
#generatore="$1/gen/generator"

risolutoreFile="$1/sol/sol_ste.cpp"
risolutore="$1/sol/soluzione"
testo="$1/testo/testo.tex"

mkdir "$1/input"
mkdir "$1/output"
i=0
g++ -std=c++11 $risolutoreFile -o $risolutore
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
