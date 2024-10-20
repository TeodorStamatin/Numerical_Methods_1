function [Y, InitialMatrix] = parse_data_set_file(file_path)

    fid = fopen(file_path, 'r');

    header = fgetl(fid);

    header_cells = strsplit(header, ' ');

    m = str2double(header_cells{1});

    n = str2double(header_cells{2});

    InitialMatrix = cell(m, n+1);

    Y = zeros(m, 1);

    for i = 1:m

        row = fgetl(fid);

        row_cells = strsplit(row, ' ');

        Y(i) = str2double(row_cells{1});

        for j = 2:n+1
            
            InitialMatrix{i,j-1} = row_cells{j};

        end
    end

    fclose(fid);
    
end
    