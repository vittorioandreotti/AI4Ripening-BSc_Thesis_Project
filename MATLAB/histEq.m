path=sprintf('%s/exportVIS/%02d/', rootpath, 0);
VIS_export_dir = dir(path);

destDir = sprintf('%s/exportVIS/%02d/Hist_eq',rootpath, 0);
if not(isfolder(destDir))
    mkdir(destDir);
end

f = waitbar(0, 'Elaborazione delle immagini in corso...', 'Name', 'Attendi...');
steps = length(VIS_export_dir);
for i=1:steps
    if VIS_export_dir(i).isdir == true
        continue;
    end
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
    waitbar(i/steps, f, sprintf('%d/%d completate', i, steps));
end
delete(f);