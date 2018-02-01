# CMS-Docker
Docker compose to run CMS - Contest Management System

# Utilizzo
Inserire il contest all'interno della cartella **main/contest/contest.yaml** con le seguenti impostazioni d'esempio:
```
name: "testOII"
description: "Test per le olimpiadi italiane di informatica"
tasks:
  - "nanga"
  - "pizzini"
  - "tamburello"
token_mode: infinite
```
È possibile scaricare le task ufficiali dal seguente repository: https://github.com/olimpiadi-informatica/oii

**NB: le task dal 2016 in avanti utilizzano un modo differente per la compilazione del file pdf ([vedi #5](https://github.com/olimpiadi-informatica/oii/issues/5))**

Per ogni cartella di contest bisogna generare i file input.txt e output.txt. Per facilitare quest'operazione è disponibile un semplice script bash da utilizzare come segue: 
```
sh utility/generaInput.sh main/contest/cartella_contenente_le_task
```
**TODO**: migliorare lo script, al momento bisogna controllare se le soluzioni sono in cpp o in python e **modificare le righe all'interno dello script bash.**

Completata la generazione del contest è possibile eseguire il seguente:
```
docker-compose up
```
Se tutto è andato come dovrebbe, alla pagina http://localhost:8889 è presente l'interfaccia di amministrazione dov'è possibile inserire i ragazzi che parteciperanno al contest (http://localhost:8888). Di default sono presenti i seguenti parametri:  
username: **admin**  
password: **p4ssw0rd**

License
-------
	The MIT License (MIT)

	Copyright (c) 2018 Alessandro Beltramo - beltramo.ale@gmail.com

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.