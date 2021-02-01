function struct_stats = stats_bbox (cell_bbox)
    for i = 1:length(cell_bbox)
        %bb = i-esimo bbox 
        bb = cell_bbox{i,1};
        s = size(bb);
        bb_r = reshape(bb, s(1)*s(2), 39);
        %min_bb: per ogni canale, si ottiene il minimo della sotto-matrice
        min_bb = min(bb_r);
        %max_bb: per ogni canale, si ottiene il massimo della sotto-matrice
        max_bb = max(bb_r);
        %mean_bb: per ogni canale, si ottiene la media della sotto-matrice
        mean_bb = mean (bb_r);
        %struct_stats = struttura contenente le statistiche per tutti i
        %bbox dell'immagine
        struct_stats(i).min = min_bb;
        struct_stats(i).max = max_bb;
        struct_stats(i).mean = mean_bb;
    end