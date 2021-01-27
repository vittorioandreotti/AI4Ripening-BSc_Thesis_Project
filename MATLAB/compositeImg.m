function Iout_res = compositeImg(I,idxR,idxG,idxB,scale)    
    d = size(I);
    Iout = uint8(zeros(d(1),d(2),3));
    Iout(:,:,1) = normalizeImg(I(:,:,idxR));
    Iout(:,:,2) = normalizeImg(I(:,:,idxG));
    Iout(:,:,3) = normalizeImg(I(:,:,idxB));
    Iout_res = imresize(Iout, scale, 'bilinear'); 