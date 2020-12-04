%Definizione dei path di origine
origin_path_NIR = 'C:\Users\andre\Desktop\Programmazione\Tesi\Materiale\DATA\data_ulivo_20-10-20\';
origin_path_VIS = 'C:\Users\andre\Desktop\Programmazione\Tesi\Materiale\DATA\data_ulivo_20-10-20\';

%Definizione dei path per le calibrazioni di VIS e NIR in B e W
path_white_VIS = strcat(origin_path_VIS,'white_calib_VIS*.npy');
path_white_NIR = strcat(origin_path_NIR, 'white_calib_NIR*.npy');
path_black_VIS = strcat(origin_path_VIS, 'black_calib_VIS*.npy');
path_black_NIR = strcat(origin_path_NIR, 'black_calib_NIR*.npy');

%Definizione dei path per le rilevazioni
path_NIR = strcat(origin_path_NIR, 'NIR*.npy');
path_VIS = strcat(origin_path_VIS, 'VIS*.npy');