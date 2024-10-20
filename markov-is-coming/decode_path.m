function [decoded_path] = decode_path(path, rows, cols)

    decoded_path = zeros(length(path) - 1, 2);

    for i = 1:length(path) - 1

        row = ceil(path(i) / cols);

        col = mod(path(i) - 1, cols) + 1;

        decoded_path(i, :) = [row, col];
    end
end
    