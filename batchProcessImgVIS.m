
pathDefinition;
loadBW_VIS;
load('calib.mat');


VIS_dir = dir(path_VIS);

destDir = sprintf('%s/export/%02d',origin_path_VIS, 0);
mkdir(destDir);

for i = 1:length(VIS_dir)
    filename = strrep(VIS_dir(i).name,'.png','');
    filename = strrep(filename,'00_VIS','VIS');
    path_o = strcat(origin_path_VIS, filename);
    [Im16,Im,I,Iq] = calibImg(path_o,Ib,Iw,M4,4);
    filename_in = sprintf('%s/export/%02d/%02d_%s.Iq.png',origin_path_VIS,0, 0, filename);
    imwrite(Iq,filename_in);
    Ir = uint8(zeros(size(I)));
    for j = 1:15
        Ir = normalizeImg(I(:,:,j));
        destDir = sprintf('%s/export/%02d',origin_path_VIS, j);
        mkdir(destDir);
        filename_in = sprintf('%s/export/%02d/%02d_%s.png',origin_path_VIS,j,j,filename);
        imwrite(Ir,filename_in);  
    end 
end