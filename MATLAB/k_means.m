clear;
All_bb = [];

%lettura dei file e inserimento in All_bb_tr che rappresenta la trasposta
%di tutti i bounding boxe
for i = 1:54
    filein = sprintf('./Analysis/x%d_filtered.csv', i);
    T = csvread(filein, 1, 1);
    All_bb = [All_bb, T];
end
All_bb_tr = transpose(All_bb);

k = 1;

%cell per i colori del plot
bboxsymb = {'r','g','c','b','y'};
%il ciclo esterno serve per plottare i risultati con tutte le prove di k
for j = 1:4
    subplot(2,2,j)
    k = k + 1;
    cidxk = kmeans(All_bb_tr,k,'dist','sqeuclidean');
    for i = 1:k
        clust = find(cidxk==i);
        a = bboxsymb{i};
        plot([1:17,19:22,24:27,29:32,34:37], All_bb_tr(clust, :), a); 
        hold on
    end
    tit = sprintf('Risultato con k=%d',k);
    title(tit,'FontSize', 20);
    xlabel('Canali','FontSize', 16);
    ylabel('Moda riflettanza normalizzata','FontSize', 16);
    grid on;
end