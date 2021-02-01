function allch =  compositeChannel(root, name)
    pathVIS = sprintf('%s/exportVIS', root);
    pathNIR = sprintf('%s/exportNIR',root);

    NIR_dir = dir(pathNIR);
    VIS_dir = dir(pathVIS);
for i = 1:length(VIS_dir)
    %conversione del nome della cartella in double
    dir_nameVIS = str2double(VIS_dir(i).name);
    % controllo (il nome della cartella deve essere un numero compresso tra
    % 1 e 15)
    if isnan(dir_nameVIS) || dir_nameVIS == 0
        continue;
    end
    VIS = sprintf('%s/%02d/%02d_VIS_%d.npy.png', pathVIS, dir_nameVIS,dir_nameVIS, name);
    imgVIS = imread(VIS);
    % si aggiungono i primi 15 canali a allch
    allch(:,:, dir_nameVIS) = imgVIS;
end

for i = 1:length(NIR_dir)
    %conversione del nome della cartella in double
    dir_nameNIR = str2double(NIR_dir(i).name);
    % controllo (il nome della cartella deve essere un numero compresso tra
    % 1 e 24)
    if isnan(dir_nameNIR) || dir_nameNIR == 0
        continue;
    end
    NIR = sprintf('%s/%02d/Reg/%02d_NIR_%d.npy.png', pathNIR, dir_nameNIR,dir_nameNIR, name);
    imgNIR = imread(NIR);
    % si aggiungono i restanti 24 canali a allch
    allch(:,:,dir_nameNIR+15) = imgNIR;
end
