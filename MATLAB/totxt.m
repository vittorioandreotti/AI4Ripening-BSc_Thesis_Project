function totxt(all_stats)
% caricare all_stats nel workspace prima di eseguire lo script
for j = 1:length(all_stats)
    for i = 1:length(all_stats(j).stats)
        X(:,i) = all_stats(j).stats(i).mode;
    end
    filein = sprintf('x%d_mode.txt', j);
    dlmwrite(filein, X);
    clear X;
end