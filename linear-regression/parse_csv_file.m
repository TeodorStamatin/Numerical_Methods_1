function [Y, InitialMatrix] = parse_csv_file(file_path)

  file = fopen(file_path, 'r');

  l = fgetl(file);

  cols = length(strfind(l, ',')) + 1;

  Y = zeros(0, 1);

  InitialMatrix = zeros(0, cols - 1);

  while ~feof(file)

      l = fgetl(file);

      l = strsplit(l, ',');

      first = str2double(l{1});

      rest = l(2:end);

      Y = [Y; first];

      InitialMatrix = [InitialMatrix; rest];
  end

  fclose(file);
end