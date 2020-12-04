clear all;
clc;

pathDefinition_VITT;
loadBW_VIS;
load('calib.mat');

VIS_dir = dir(path_VIS);

% %Creazione cartelle
% destDir = sprintf('%s/exportVIS/%02d',origin_path_VIS, 0);
% mkdir(destDir);
% for i = 1:15
%     destDir = sprintf('%s/exportVIS/%02d',origin_path_VIS, i); 
%     mkdir(destDir);
% end

for i = 1:length(VIS_dir)
    %Controllo su filename
    filename = strrep(VIS_dir(i).name,'.png','');
    filename = strrep(filename,'00_VIS','VIS');
    %Ad ogni iterazione path_o corrisponde al path del file i-esimo
    path_o = strcat(origin_path_VIS, filename);
    % @Im16 = uint16, 1088x2048
    % @Im   = 1088x2048
    % @Iq   = 3 canali corrispondenti a RGB (218x410x3). 
    %         I migliori canali sono: R=15, G=08, B=01.
    % @I    = Struttura contenente tutti i 15 canali VIS (218x410x15)
    [Im16,Im,I,Iq] = calibImg(path_o,Ib,Iw,M4,4);
    filename_in = sprintf('%s/exportVIS/%02d/%02d_%s.png',origin_path_VIS,0, 0, filename);
    %Ruota l'immagine di 270° in senso antiorario
    Iq_rot270 = rot90(Iq, 3);
    imwrite(Iq_rot270,filename_in);
    Ir = uint8(zeros(size(I)));
    for j = 1:15
        Ir = normalizeImg(I(:,:,j));
        filename_in = sprintf('%s/exportVIS/%02d/%02d_%s.png',origin_path_VIS,j,j,filename);
        Ir_rot270 = rot90(Ir, 3);
        imwrite(Ir_rot270,filename_in);  
    end 
end