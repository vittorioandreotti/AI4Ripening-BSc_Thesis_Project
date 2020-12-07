clear all;
clc;

pathDefinition_VITT;
loadBW_NIR;
load('calib.mat');

NIR_dir = dir(path_NIR);

channel = [8, 8, 8];
%Creazione cartelle
destDir = sprintf('%s/exportNIR/%02d',origin_path_NIR, 0);
mkdir(destDir);
for i = 1:24
    destDir = sprintf('%s/exportNIR/%02d',origin_path_NIR, i); 
    mkdir(destDir);
end

for i = 1:length(NIR_dir)
    %Controllo su filename
    filename = strrep(NIR_dir(i).name,'.png','');    
    filename = strrep(filename,'00_NIR','NIR');
    %Ad ogni iterazione path_o corrisponde al path del file i-esimo
    path_o = strcat(origin_path_NIR,filename);
    % @Im16 = uint16, 1088x2048
    % @Im   = 1088x2048
    % @Iq   = Falso colore, 3 canali corrispondenti a RGB (218x410x3)
    % @I    = Struttura contenente tutti i 24 canali NIR (218x410x24)
    [Im16,Im,I,Iq] = calibImg(path_o,Ib,Iw,M5,5);
    filename_in = sprintf('%s/exportNIR/%02d/%02d_%s.png',origin_path_NIR,0, 0, filename);
    %Ruota l'immagine di 270° in senso antiorario
    Iq_rot270 = rot90(Iq, 3);
    imwrite(Iq_rot270,filename_in);
    Ir = uint8(zeros(size(I)));
    for j = 1:24
        Ir = normalizeImg(I(:,:,j));
        filename_in = sprintf('%s/exportNIR/%02d/%02d_%s.png',origin_path_NIR,j,j,filename);
        Ir_rot270 = rot90(Ir, 3);
        imwrite(Ir_rot270,filename_in);
    end
end