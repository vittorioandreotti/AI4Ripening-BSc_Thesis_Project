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
    
    RGB = imread(path_compl);
    HSV = rgb2hsv (RGB);
    R = HSV(:,:,1);
    G = HSV(:,:,2);
    B = HSV(:,:,3);
    R = adapthisteq(R);
    G = adapthisteq(G);
    B = adapthisteq(B);
%   HSV(:,:,1) = R;
%   HSV(:,:,2) = G;
    HSV(:,:,3) = B;
    RGB_ = hsv2rgb (HSV);

    imwrite(RGB_, path_in);
end