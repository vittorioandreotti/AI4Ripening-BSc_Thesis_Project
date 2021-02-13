# Stima del grado di maturazione di olive mediante immagini multispettrali VIS-NIR coregistrate.

## Introduzione
L'obiettivo del progetto è sfruttare il clustering, un approccio unsupervised, per il riconoscimento del grado di maturazione di olive. Le immagini sono state catturate con un sensore multispettrale e raccolte nella cartella "dataset", insieme ai file di calibrazione.

## Esecuzione
La maggior parte del codice è stato scritto in MATLAB e di seguito se ne illustra la struttura:
### Main
Il file "Main.m" permette di eseguire elaborazione delle immagini ed equalizzazione delle VIS. All'avvio, scegliere la cartella dataset contenente le rilevazioni tramite l'interfaccia grafica e la tipologia di immagini da elaborare.

### Coregistrazione
Per la coregistrazione servirsi del file "regIm.m", ricordandosi di specificare il "rootpath" nella prima riga del codice (è la cartella dataaset prima menzionata).

### Statistiche
Per ottenere le statistiche, eseguire il file "HistAnalys.m" specificando il rootpath.

### Clustering
Per il clustering:
1) Convertire la struttura contenente le statistiche in file ".txt".
2) Eliminare le bande rumorose con il notebook Jupiter e scaricare le esportazioni ".csv".
3) Dell'importazione dei file ".csv" in MATLAB se ne occupa sia "k_means.m" che "dbscan.m".
4) Per adottare algoritmo k-means --> "k_means.m".
5) Per adottare algoritmo DBscan --> "db_scan.m".

## Package
I tool sfruttati su MATLAB (versione R2020a) sono:
1) Image Processing Toolbox.
2) Statistics and Machine Learning Toolbox.
