clear all;
clc;

pathDefinition;
loadBW_NIR;
load('calib.mat');

NIR_dir = dir(path_NIR);

filename = 'NIR_1603201139930.npy';

destDir = sprintf('%s/prova_%s/',origin_path_NIR, filename);
mkdir(destDir);

path_o = strcat(origin_path_NIR,filename);
[Im16,Im,I,Iq] = calibImg(path_o,Ib,Iw,M5,5);

for i = 1:24
    for j = 1:24
        for k = 1:24
            I_=uint8(zeros(size(I)));
            I_= compositeImg(I, i, j, k, 5);
            filename_in = sprintf('%s/prova_%s/%02d_%02d_%02d_%s.png',origin_path_NIR, filename, i, j, k, filename);
            imwrite(I_, filename_in);
        end
    end        
end