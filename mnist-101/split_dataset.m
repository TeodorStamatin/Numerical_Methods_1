function [x_train, y_train, x_test, y_test] = split_dataset(X, y, percent)

  idx = randperm(size(X,1));

  train_idx = idx(1:floor(percent*size(X,1)));
  test_idx = idx(floor(percent*size(X,1))+1:end);

  x_train = X(train_idx,:);
  y_train = y(train_idx);
  x_test = X(test_idx,:);
  y_test = y(test_idx);
end
