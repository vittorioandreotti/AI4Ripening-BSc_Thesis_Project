rootpath = 'C:\Users\andre\Desktop\Università\Tesi\Analisi maturazione multispettrale\DATA\data_ulivo_20-10-20';
pathVIS = sprintf('%s/exportVIS/00/Hist_eq', rootpath);
VIS_dir = dir(pathVIS);
%File json contenente Dataset di LabelBox
JSON = 'C:\Users\andre\Desktop\Università\Tesi\Analisi maturazione multispettrale\label.json';

steps = length(VIS_dir);
% stepss: var avanzameno processo
stepss = 0;

for i = 1:steps
    if VIS_dir(i).isdir == false
        stepss = stepss +1;
    end
end 

f = waitbar(0, 'Elaborazione delle immagini in corso...', 'Name', 'Analisi reflettanza');
% a: var avanzamento processo
a = 0;
for i = 1:steps
    if VIS_dir(i).isdir == true
        continue;
    end
    a = a+1;
    % name_VIS: nome dell'i-esima immagine VIS
    name_VIS = str2double(VIS_dir(i).name(8:end-8));
    % all_cha: struttura contenente tutti i canali (VIS e NIR) per
    % l'i-esima immagine
    all_cha = compositeChannel (rootpath, name_VIS);
    % cell_bbox: cell contenente tutte le bbox dell'i-esima immagine
    cell_bbox = bbox(JSON, name_VIS, all_cha);
    % struct_stats: struttura contenente le statistiche (min, max, mean)
    struct_stats = stats_bbox (cell_bbox);
    % all_stats: struttura contenente le statistiche di ogni immagine con
    % relativo nome
    all_stats(a).name = VIS_dir(i).name;
    all_stats(a).stats = struct_stats;
    waitbar(a/stepss, f, sprintf('%d/%d completate', a, stepss));
end