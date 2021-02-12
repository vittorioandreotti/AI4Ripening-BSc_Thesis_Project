clear;
clc;

load('calib.mat');
% @rootpath = cartella del dataset
roothpath = '';
condition = true;
while condition 
    if ischar(roothpath)
        rootpath = uigetdir('','SELEZIONA IL DATASET.');
        condition = false;
    else 
        waitfor(warndlg('Effettua una scelta.', 'ATTENZIONE'));
        rootpath = uigetdir('','SELEZIONA IL DATASET.');
    end
end

% @indx = scelta utente
list = {'VIS', 'NIR'};
[indx, tf] = listdlg('PromptString', {'Seleziona una modalità.'}, 'SelectionMode', 'single', 'ListString', list);

% ciclo per indurre la scelta dell'utente
condition = true;
while condition
    if tf == 1
        [path_white, path_black, path_MOD] = pathDef (rootpath, indx);
        condition = false;
    else 
        waitfor(warndlg('Effettua una scelta.', 'ATTENZIONE'));
        [indx, tf] = listdlg('PromptString', {'Seleziona una modalità.'}, 'SelectionMode', 'single', 'ListString', list);
    end
end

loadBW;

% @MOD_dir = struttura directory
MOD_dir = dir(path_MOD);

if indx == 1
    batchProcessImg;
    histEq;
elseif indx == 2
    batchProcessImg;
else
    errordlg('Ops! Qualcosa è andato storto', 'ERRORE');
end