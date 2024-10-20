function [X, y] = load_dataset(path)

  data = load(path);

  X = data.X;

  y = data.y;

  X = [ones(size(X,1),1) X];
  
  X = X(:, 2:end);

end
