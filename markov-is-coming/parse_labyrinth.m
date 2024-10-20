function [Labyrinth] = parse_labyrinth(file_path)

    fid = fopen(file_path, 'r');

    if fid == -1
        error('Nu se poate deschide fisierul');
    end

    line = fgetl(fid);

    dimensions = str2num(line);

    m = dimensions(1);

    n = dimensions(2);

    Labyrinth = zeros(m,n);

    for i = 1:m

        line = fgetl(fid);

        values = str2num(line);

        for j = 1:n

            bit_values = bitget(values(j), 1:4);

            Labyrinth(i,j) = bit_values(4)*8 + bit_values(3)*4 + bit_values(2)*2 + bit_values(1);
        end
    end

    fclose(fid);
end
