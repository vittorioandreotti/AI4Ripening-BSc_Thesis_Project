clear all;
clc;

pathDefinition;
loadBW_VIS;
load('calib.mat');

VIS_dir = dir(path_VIS);

filename = 'VIS_1603201139930.npy';

destDir = sprintf('%s/prova_%s/',origin_path_VIS, filename);
mkdir(destDir);

path_o = strcat(origin_path_VIS,filename);
[Im16,Im,I,Iq] = calibImg(path_o,Ib,Iw,M4,4);

for i = 1:15
    for j = 1:15
        for k = 1:15
            I_=uint8(zeros(size(I)));
            I_= compositeImg(I, i, j, k, 4);
            filename_in = sprintf('%s/prova_%s/%02d_%02d_%02d_%s.png',origin_path_VIS, filename, i, j, k, filename);
            imwrite(I_, filename_in);
        end
    end        
end