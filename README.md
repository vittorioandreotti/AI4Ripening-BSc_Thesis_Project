# Estimation of Olive Ripeness Degree Using Co-Registered VIS–NIR Multispectral Images

## Introduction
The goal of the project is to exploit clustering—an unsupervised approach—for recognizing the ripeness (maturation stage) of olives. The images were captured with a multispectral sensor (original source contained truncated text [...]).

## Execution
Most of the code was written in MATLAB, and its structure is outlined below.

### Main
The file `Main.m` allows you to perform image processing and VIS equalization. At startup, select the dataset folder containing the acquisitions through the graphical interface and the (original source truncated here [...]).

### Coregistration
For coregistration use the file `regIm.m`, remembering to specify the `rootpath` on the first line of the code (this is the previously mentioned dataset folder).

### Statistics
To obtain the statistics, run the file `HistAnalys.m` specifying the `rootpath`.

### Clustering
For clustering:
1. Convert the structure containing the statistics into `.txt` files.
2. Remove noisy bands using the Jupyter notebook (spelled “Jupiter” in the original) and download the exported `.csv` files.
3. Import of the `.csv` files into MATLAB is handled by both `k_means.m` and `dbscan.m`.
4. To use the k-means algorithm → `k_means.m`.
5. To use the DBSCAN algorithm → `db_scan.m`.

## Packages
The MATLAB toolboxes (version R2020a) used are:
1. Image Processing Toolbox.
2. Statistics and Machine Learning Toolbox.