clear all;
clc;

filename1 = ('C:\Users\mely7\Desktop\Tirocinio\data_ulivo_20-10-20\exportNIR\00\00_NIR_1603201833233.npy.png');
filename2 = ('C:\Users\mely7\Desktop\Tirocinio\data_ulivo_20-10-20\exportVIS\00\00_VIS_1603201834233.npy.png');

%conversione immagini da RGB a scala di grigi
I1 = rgb2gray(imread(filename1));
I2 = rgb2gray(imread(filename2));

%trovo angoli mediante algoritmo di Harris
points1 = detectHarrisFeatures(I1);
points2 = detectHarrisFeatures(I2);

%estrazione di caratteristiche, noti anche come descrittori, e le loro posizioni corrispondenti, da un'immagine
[features1,valid_points1] = extractFeatures(I1,points1);
[features2,valid_points2] = extractFeatures(I2,points2);

%abbinamento delle caratteristiche
indexPairs = matchFeatures(features1,features2);

%recupero delle posizioni dei punti corrispondenti per ogni immagine
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

%visualizzazione dei punti corrispondenti
%si riesce a vedere l'effetto della traslazione tra le due immagini 
figure; 
showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);


