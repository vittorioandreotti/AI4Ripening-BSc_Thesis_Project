function struct_stats = stats_bbox (cell_bbox)
    for i = 1:length(cell_bbox)
        %bb = i-esimo bbox 
        bb = double(cell_bbox{i,1});
        bb_norm = bb./255;
        s = size(bb_norm);
        bb_r = reshape(bb_norm, s(1)*s(2), 39);
        %min_bb: per ogni canale, si ottiene il minimo della sotto-matrice
        min_bb = min(bb_r);
        %max_bb: per ogni canale, si ottiene il massimo della sotto-matrice
        max_bb = max(bb_r);
        %mean_bb: per ogni canale, si ottiene la media della sotto-matrice
        mean_bb = mean (bb_r);
        %mode_bb: per ogni canale, si ottiene la moda della
        %sotto-matrice
        mode_bb = mode (bb_r);
        %mode_bb: per ogni canale, si ottiene la mediana della
        %sotto-matrice
        median_bb = median (bb_r);
        %struct_stats = struttura contenente le statistiche per tutti i
        %bbox dell'immagine
        struct_stats(i).min = min_bb;
        struct_stats(i).max = max_bb;
        struct_stats(i).mean = mean_bb;
        struct_stats(i).mode = mode_bb;
        struct_stats(i).median = median_bb;
    end