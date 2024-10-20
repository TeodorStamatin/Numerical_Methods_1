function [Error] = ridge_regression_cost_function(Theta, Y, FeMatrix, lambda)
  
  [m, n] = size(FeMatrix);

  FeMatrix = [ones(m, 1) FeMatrix];

  h = FeMatrix * Theta;

  Error = (1/(2*m)) * sum((Y - h).^2) + lambda * sum(Theta(2:end).^2);

  Error = Error - lambda * abs(Theta(1));
  
  end