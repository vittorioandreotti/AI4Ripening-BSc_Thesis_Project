function cell_bbox = bbox(filename, img_name, allch)

    % text: flusso char JSON
    text = fileread(filename);
    % JS: struttura JSON
    JS = jsondecode(text);
    for i = 1:length(JS)
        externalID = str2double(JS(i).ExternalID(8:end-8));
        %l'id dell'immagine nel dataset deve corrispondere al nome
        %dell'immagine passato alla funzione
        if externalID ~= img_name
            continue;
        else 
            % bboxes: contiene tutti i bounding box per l'immagine
            bboxes = JS(i).Label.objects;
        end
    end
    
    % cell_box: cell destinata a contenere tutte le sottomatrici 
    cell_bbox = {};
    try
        for i = 1:length (bboxes)
            %coord_bbox: contiene le cordinate dell'i-esimo bbox
            coord_bbox = bboxes(i).bbox;
            x_start = coord_bbox.left;
            x_stop = x_start + coord_bbox.width;
            y_start = coord_bbox.top;
            y_stop = y_start + coord_bbox.height;
            %bbox: sottomatrice di allch contenente tutti i pixel del
            %bounding box
            bbox = allch(y_start : y_stop, x_start : x_stop, :);
            cell_bbox {i,1} = bbox;
        end
    catch
        %Se bboxes non è stato creato (ovverol'immagine non è stata
        %'labelizzata'), viene mostrato un dialog di errore.
        err = sprintf('Immagine VIS_%d non trovata', img_name);
        errordlg(err, 'ERRORE');
    end
    