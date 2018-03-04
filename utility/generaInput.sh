#! /bin/bash

##############################################################
# Script per la conversione degli esercizi presenti nel repo
# https://github.com/olimpiadi-informatica/oii
# in cartelle di contest riutilizzabili da CMS
#
# Creato da: Beltramo Alessandro <beltramo.ale@gmail.com>
##############################################################

if [ -z "$1" ]
  then
    echo "UTILIZZO: generaInput.sh cartella/contenente/l'esercizio/
    
Genera i file di input e di output necessari a creare un contest
    
ESEMPIO: generaInput.sh main/contest/nanga"
    exit 0
fi

##############################################################
# 1- Riconoscimento del generatore dei file di input
##############################################################
echo "Analizzando il problema nella cartella $1"
genfile="$1/gen/GEN"
generatore=""
if [ -f "$1/gen/generatore.py" ]; then                 # CASO 1: generatore in Python
  generatore="python $1/gen/generatore.py"
  echo "Generatore di input in Python"
elif [ -f "$1/gen/generatore.cpp" ]; then              # CASO 2: generatore in CPP
  g++ -std=c++11 $1/gen/generatore.cpp -o $1/gen/generator
  generatore="$1/gen/generator"
  echo "Generatore di input in C++"
else
  echo "Generatore di input non trovato nella cartella $1/gen/"
  exit 1
fi

##############################################################
# 2- Riconoscimento del programma di soluzione
##############################################################
risolutore="$1/sol/soluzione"
if [ -f "$1/sol/soluzione.cpp" ]; then                  # CASO 1: file soluzione.cpp
  g++ -std=c++11 "$1/sol/soluzione.cpp" -o $risolutore
elif [ -f "$1/sol/soluzione.c" ]; then                  # CASO 2: ci sono più soluzioni e c'è un file di link alla soluzione
  gcc "$1/sol/soluzione.c" -o $risolutore
else
  echo "Soluzione non trovata nella cartella $1/sol/"
  exit 1
fi

##############################################################
# 3- Generazione dei file di input e di output
##############################################################
testo="$1/testo/testo.tex"
mkdir "$1/input"
mkdir "$1/output"
i=0
sed 's:#.*$::g' $genfile | sed '/^$/d' | while read line  # Rimuovo tutti i commenti e le righe vuote dal file
do                                                        # Ciclo riga per riga
  echo "Generazione case test:$i"
  $generatore $line > $1/input/"input${i}.txt"
  cat $1/input/"input${i}.txt" | $risolutore > $1/output/"output${i}.txt"
  i=$(($i+1))
done

# Compile pdf in folder testo
echo "Generazione PDF - Se non funziona utilizzare: https://github.com/algorithm-ninja/cmsbooklet"
cd $1/testo && pdflatex testo.tex > consoleLog
echo "Terminato!"
