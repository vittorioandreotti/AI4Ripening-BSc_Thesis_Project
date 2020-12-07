function [Im16,Im,I,Iq] = calibImg(path,Ib,Iw,M,ws,channel)

Im16 = (import_npy(path));
% conversione Im16 in double
Im = double(Im16);
% perc riflettanza tavoletta di calibrazione
calib_factor = 0.4;
% Calibrazione
Im = (Im - Ib) ./ (Iw - Ib) * calib_factor;
step = ws;
corrx = 0;
corry = 0;
Icalib = Im;
%I = immagine rimpicciolita di un fattore di scala pari a ws
I = zeros(int32(1088-corrx)/step, int32((2048-corry)/step),step*step-1);
for i = 1:step:1088-3
    for j = 1:step:2048-3
        %calcolo indice del blocco
        rg = floor((i-1)/step) + 1;
        cg = (j-1)/step + 1;
        %v = Im(i,j);
        %I(rg, cg,k) = v;
        for k = 1:length(M)-1
            r = floor((k-1)/step) + 1;
            c = mod(k-1,step) + 1;
            C = M((r-1)*step + c,:);
            Isub = Im(i:i+step-1,j:j+step-1);
            Isubr = reshape(Isub,step*step,1);
            v = C * Isubr;
            %v = Im(i,j);
            I(rg, cg,k) = v;
            %Isub = reshape(Im,step*step,1);
        end
    end
end

R = channel(1);
G = channel(2);
B = channel(3);
Iq = compositeImg(I,R,G,B,ws);