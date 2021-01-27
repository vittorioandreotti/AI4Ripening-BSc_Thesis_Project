pathVIS = sprintf('%s/exportVIS/00/Hist_eq', rootpath);
pathNIR = sprintf('%s/exportNIR/13',rootpath);

NIR_dir = dir(pathNIR);
VIS_dir = dir(pathVIS);
steps = length(VIS_dir);
stepss = 0;
for i = 1:length(VIS_dir)
    if VIS_dir(i).isdir == false
        stepss = stepss +1;
    end
end  

f = waitbar(0, 'Elaborazione delle immagini in corso...', 'Name', 'Image Register');

for i = 3:steps
    VIS_tm = str2double(VIS_dir(i).name(8:end-8));
    Scrt = VIS_tm;
    for j = 3:length(NIR_dir)
        NIR_tm = str2double(NIR_dir(j).name(8:end-8));
        scrt = abs(VIS_tm - NIR_tm);
        if scrt < Scrt 
            temp = NIR_tm;
            Scrt = scrt;
            if scrt == 0
                VIS = sprintf('%s/00_VIS_%d.npy.png',pathVIS, VIS_tm);
                NIR = sprintf('%s/%02d_NIR_%d.npy.png',pathNIR, 13, NIR_tm);
                imgVIS = imread(VIS);
                imgNIR = imread(NIR);
                try 
                    filename = sprintf('%s/exportNIR/%02d/Reg/%02d_NIR_%d.npy.png',rootpath, 13, 13, NIR_tm);
                    [movreg, p] = registerImages(imgNIR, imgVIS);
                    imwrite(movreg.RegisteredImage, filename);
                    for k = 0 : 24
                        %Creazione cartelle
                        destDir = sprintf('%s/exportNIR/%02d/Reg',rootpath, k);
                        if not(isfolder(destDir))
                            mkdir(destDir);
                        end
                        NIR = sprintf('%s/exportNIR/%02d/%02d_NIR_%d.npy.png',rootpath, k, k, NIR_tm);
                        imgNIR = imread(NIR);
                        
                        filename = sprintf('%s/exportNIR/%02d/Reg/%02d_NIR_%d.npy.png',rootpath, k, k, NIR_tm);
                        movreg = imwarp (imgNIR, p.movRefObj, p.tform, 'OutputView', p.fixRefObj, 'SmoothEdges', p.val);
                        imwrite(movreg, filename);
                    end
                catch 
                    break
                end
            end
        else
            break
        end
    end
   waitbar((i-2)/stepss, f, sprintf('%d/%d completate', i-2, stepss));
end

delete(f);