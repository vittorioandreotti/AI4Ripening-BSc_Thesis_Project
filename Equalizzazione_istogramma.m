
im = imread('C:\Users\andre\Desktop\Programmazione\Tesi\Materiale\am\prova_VIS_1603201139930.npy\15_08_01_VIS_1603201139930.npy.png');


% % Imposto il numero di livelli di grigio:
% L=256;
% % Salvo in due variabili la dimensione dell'immagine:
% [m n]=size(im);
% % Salvo in una variabile il numero di pixel totali dell'immagine:
% N=m*n;
% % Imposto una vettore colonna lungo 256 righe:
% ist=zeros(L,1);
% % Popolo il vettore assegnando in ogni riga il numero di occorrenze
% % di ogni livello di grigio:
% for j = 1:3
%     Im = im(:, :, 1);
%     for i=1:L
%         ist(i)=sum(sum(Im==i-1));
%     end
% end
% % Creo un vettore colonna contenente i numeri da 0 a 1 con passo 1/255:
% r=[0.0:1/(L-1):1.0]';
% % Effettuo la somma cumulativa del vettore 'ist' dividendolo per il numero di pixel
% % in modo da ottenere la probabilità incrementale di ogni livello:
% s=cumsum(ist)/N;
% % Creo un vettore colonna contenente i numeri da 0 a 255:
% ss=[0:L-1]';
% % Effettuo la traslazione di ogni livello di grigio seguendo la probabilità:
% ss=round(ss+(s-r)*(L-1));
% % Converto la matrice dell'immagine originale in un vettore colonna di lunghezza N:
% im_vett=reshape(Im,m*n,1);
% % Disegno l'immagine di output (equalizzata) richiamando per ogni pixel il
% % corrispettivo valore calcolato:
% im_out=uint8(reshape(ss(im_vett),m,n));
% % Mostro a schermo il risultato:
% subplot(1,2,1);
% imshow(im);
% subplot(1,2,2);
% imshow(im_out);