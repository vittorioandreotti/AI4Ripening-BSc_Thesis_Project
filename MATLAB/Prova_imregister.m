%i path sono da cambiare
path1='C:\Users\andre\Desktop\Programmazione\Tesi\Materiale\DATA\data_ulivo_20-10-20\exportVIS\00\Hist_eq\00_VIS_1603201834108.npy.png';
path2='C:\Users\andre\Desktop\Programmazione\Tesi\Materiale\DATA\data_ulivo_20-10-20\exportNIR\00\00_NIR_1603201834108.npy.png';
[Im1, color1]=imread(path1);
[Im2, color2]=imread(path2);
[optimizer, metric] = imregconfig ('multimodal');
Im=imregister(rgb2gray(Im1), rgb2gray(Im2), 'affine', optimizer, metric);
% Im=double(Im)./256;
%  Im=ind2rgb(Im, color2);
montage({Im, Im1, Im2});