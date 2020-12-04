function Ir = normalizeImg(I)
%m = min(I(:));
%M = max(I(:));
I(I<0)=0;
I(I>=1)=1;
m = 0;
M = 1;
Ir = uint8((I - m) ./ (M - m) *255);