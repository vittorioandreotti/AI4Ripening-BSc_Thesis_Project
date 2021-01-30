if indx == 1
    k = 15;
    ws = 4;
    M = M4;
    export = 'exportVIS';
    alpha=3.5;
    % @channel[] permette di selezionare i canali da passare a compositeImg
    channel = [15, 8, 1];

elseif indx == 2
    k = 24;
    ws = 5;
    M = M5;
    export = 'exportNIR';
    alpha = 4.37;
    % @channel[] permette di selezionare i canali da passare a compositeImg
    channel = [8, 8, 13];
else
    errordlg('Ops! Qualcosa è andato storto', 'ERRORE')
end
    
    %Creazione cartelle
for r = 0:k
    destDir = sprintf('%s/%s/%02d',rootpath, export, r); 
    if not(isfolder(destDir))
       mkdir(destDir);
    end
end

stepss = 0;
for i = 1:length(MOD_dir)
    if MOD_dir(i).isdir == false
        stepss = stepss +1;
    end
end  

f = waitbar(0, 'Elaborazione delle immagini in corso...', 'Name', 'Esportazioni');
steps = length(MOD_dir);
for i = 1:steps
    if MOD_dir(i).isdir == true
        continue;
    end
    %Controllo su filename
    % @filename = nome del file con estensione .npy
    filename = strrep(MOD_dir(i).name,'.png','');    
    filename = strrep(filename,'00_NIR','NIR');
    %Ad ogni iterazione path_o corrisponde al path del file i-esimo
    path_o = sprintf('%s/%s', rootpath,filename);
    % @Im16 = uint16, 1088x2048
    % @Im   = 1088x2048
    % @Iq   = Falso colore, 3 canali corrispondenti a RGB
    % @I    = Struttura contenente tutti i k canali (k=15 per VIS, k=24 per NIR) (218x410xk)
    [Im16,Im,I,Iq] = calibImg(path_o,Ib,Iw,M,ws,channel, alpha);
    filename_in = sprintf('%s/%s/%02d/%02d_%s.png',rootpath,export, 0, 0, filename);
    %Ruota l'immagine di 270° in senso antiorario
    Iq_rot270 = rot90(Iq, 3);
    imwrite(Iq_rot270,filename_in);
    Ir = uint8(zeros(size(I)));
    for j = 1:k
        Ir = normalizeImg(I(:,:,j));
        Ir_res = imresize(Ir, alpha, 'bilinear');
        filename_in = sprintf('%s/%s/%02d/%02d_%s.png',rootpath, export, j,j,filename);
        Ir_rot270 = rot90(Ir_res, 3);
        imwrite(Ir_rot270,filename_in);
    end
    
    waitbar(i/stepss, f, sprintf('%d/%d completate', i, stepss));
end
delete(f);