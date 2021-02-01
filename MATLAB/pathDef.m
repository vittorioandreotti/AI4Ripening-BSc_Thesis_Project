function [path_white, path_black, path_MOD] = pathDef (rootpath, MOD)

    % @path_white; @path_black = path per le calibrazioni di VIS e NIR in B e W 
    % @path_MOD = path per la rilevazione in base alla modalità scelta
    if MOD == 1
        path_white = sprintf('%s/%s',rootpath,'white_calib_VIS*.npy');
        path_black = sprintf('%s/%s',rootpath,'black_calib_VIS*.npy');
        path_MOD = sprintf('%s/%s',rootpath,'VIS*.npy');
    else 
        path_white = sprintf('%s/%s',rootpath,'white_calib_NIR*.npy');
        path_black = sprintf('%s/%s',rootpath,'black_calib_NIR*.npy');
        path_MOD = sprintf('%s/%s',rootpath,'NIR*.npy');
    end
