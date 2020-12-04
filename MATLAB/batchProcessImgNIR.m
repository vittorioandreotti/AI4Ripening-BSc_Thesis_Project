clear all;
clc;

pathDefinition;
loadBW_NIR;
load('calib.mat');

NIR_dir = dir(path_NIR);

%%destDir = sprintf('%s/export/%02d',origin_path_NIR, 0);
%%mkdir(destDir);

for i = 1:length(NIR_dir)
    filename = strrep(NIR_dir(i).name,'.png','');    
    filename = strrep(filename,'00_NIR','NIR');
    %%path_o = strcat(origin_path_NIR, filename);
    path_o = strcat(origin_path_NIR,filename);
    [Im16,Im,I,Iq] = calibImg(path_o,Ib,Iw,M5,5);
    filename_in = sprintf('%s/export/%02d/%02d_%s.Iq.png',origin_path_NIR,0, 0, filename);
    imwrite(Iq,filename_in);
    Ir = uint8(zeros(size(I)));
    for j = 1:24
        Ir = normalizeImg(I(:,:,j));
        %%destDir = sprintf('%s/export/%02d',origin_path_NIR, j); 
        %%mkdir(destDir);
        filename_in = sprintf('%s/export/%02d/%02d_%s.png',origin_path_NIR,j,j,filename);  
        imwrite(Ir,filename_in);
    end
end