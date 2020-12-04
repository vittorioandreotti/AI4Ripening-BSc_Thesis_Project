clear all;
clc;

pathDefinition_VITT;

path=sprintf('%s/exportVIS/%02d/', origin_path_VIS, 0);
VIS_export_dir = dir(path);

destDir = sprintf('%s/exportVIS/%02d/Hist_eq',origin_path_VIS, 0);
mkdir(destDir);

for i=3:length(VIS_export_dir)
    file = VIS_export_dir(i).name;
    path_compl=strcat(path, file);
    path_in=sprintf('%s/%s',destDir, file); 
    I = imread(path_compl);
    I_eq = histeq(I);
    imwrite(I_eq, path_in);
end