th_area = 70.0;
statsO = zeros(length(STATS),3);
for i = 1:length(STATS)
    statsO(i,3) = STATS(i).Area;
    statsO(i,1) = double(STATS(i).Area) / th_area;
    if( STATS(i).Area >= 3.0)        
        statsO(i,2) = floor(STATS(i).Area / th_area);
        if(statsO(i,2) < 1)
            statsO(i,2) = 1;
        end
    else
        statsO(i,2) = 0;
    end
end

count_tot = sum(statsO(:,2));