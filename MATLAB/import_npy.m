function I = import_npy(path)
I = uint16(zeros(1088,2048));
fp = fopen(path,'r');
c = fread(fp, 8);
c = fread(fp, 2);
c = fread(fp, 118);
data = fread(fp,2048*1088*2);
fclose(fp);
for i = 1:(2048*1088)
    v = uint16(data((i-1)*2+1) + data((i-1)*2 + 2) * 256);
    r = floor( (i - 1) / 2048) + 1;
    c = mod(i - 1, 2048) + 1;
    I(r,c) = v;
end