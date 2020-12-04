% % r = []
% % 
str = 'D:\sw\XIMEA\API\Python\examples\various\report\VIS\20190911VIS\salad';

 
if(not(isempty(strfind(str,'VIS'))))
    n_ch = 16;
else
    n_ch = 25;
end
    
r = [];
for i = 0:(n_ch-1)
    filename = sprintf("%s\\%02d.txt",str,i);
    r = [r table2cell(importDNNResults(filename))];
end





r1 = 0:(n_ch-1);

c = 1

P = zeros(n_ch,4);
R = zeros(n_ch,4);
mAp = zeros(n_ch,4);
F1 = zeros(n_ch,4);

for i = 9:15:n_ch*15
    %12 P
    i
    [P_tmp idx_p] = max(cell2mat(r(:,i)));    
    [R_tmp idx_r] = max(cell2mat(r(:,i+1)));
    [mAp_tmp idx_map] = max(cell2mat(r(:,i+2)));
    [F1_tmp idx_f1] = max(cell2mat(r(:,i+3)));
    P(c,:) = [ cell2mat(r(idx_p,i)), cell2mat(r(idx_r,i)), cell2mat(r(idx_map,i)), cell2mat(r(idx_f1,i)) ];
    R(c,:) = [ cell2mat(r(idx_p,i+1)), cell2mat(r(idx_r,i+1)), cell2mat(r(idx_map,i+1)), cell2mat(r(idx_f1,i+1)) ];
    mAp(c,:) = [ cell2mat(r(idx_p,i+2)), cell2mat(r(idx_r,i+2)), cell2mat(r(idx_map,i+2)), cell2mat(r(idx_f1,i+2)) ];
    F1(c,:) = [ cell2mat(r(idx_p,i+3)), cell2mat(r(idx_r,i+3)), cell2mat(r(idx_map,i+3)), cell2mat(r(idx_f1,i+3)) ];
    c = c + 1;
end

filename = sprintf("%s\\comparison.txt",str);
dlmwrite(filename, [P, R, mAp, F1]);

