% @white_path contiene tutti i file per la calibrazione del W
% @black_path contiene tutti i file per la calibrazione del B
white_path = dir(path_white);
black_path = dir(path_black);
l = length(white_path);

Iw = zeros(1088,2048);
for i = 1:l
    path = sprintf('%s/%s', rootpath, white_path(i).name);
    tmp = double(import_npy(path));
    Iw = Iw + tmp;
end
Iw = Iw ./ l;

Ib = zeros(1088,2048);
for i = 1:l
    path = sprintf('%s/%s',rootpath, black_path(i).name);
    tmp = double(import_npy(path));
    Ib = Ib + tmp;
end
Ib = Ib ./ l;


