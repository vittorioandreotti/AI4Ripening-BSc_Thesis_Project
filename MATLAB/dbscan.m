clear;
close;
All_bb = [];
for i = 1:54
    filein = sprintf('./Analysis/x%d_filtered.csv', i);
    T = csvread(filein, 1, 1);
    All_bb = [All_bb, T];
end
All_bb_tr = transpose(All_bb);

eps = 0.05;
minpts = 4;
cidx = dbscan(All_bb_tr(:,:),eps, minpts);
%le due righe commentate servono per visualizzare il grafico k-distance.
%Rimuovere il commento e commentare dal for in poi per una corretta
%esecuzione.
% kD = pdist2(All_bb_tr,All_bb_tr,'euc','Smallest',minpts);
% plot(sort(kD(end,:)));
bboxsymb = {'b','c','k','m','#77AC30','g','r','y','#7E2F8E','#EDB120'};
for i = 1:9
    clust = find(cidx==i);
    color = bboxsymb{i}; 
    plot([1:17,19:22,24:27,29:32,34:37],All_bb_tr(clust, :), 'Color', color); 
    hold on
end
title('DBSCAN','Fontsize', 20);
xlabel('Canali','Fontsize', 15);
ylabel('Media riflettanza normalizzata', 'Fontsize', 15);