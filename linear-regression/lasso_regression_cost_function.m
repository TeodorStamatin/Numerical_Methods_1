function [Error] = lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)

  [m, n] = size(FeMatrix);

  FeMatrix = [ones(m, 1), FeMatrix];

  h = FeMatrix * Theta;

  Error = (1/m) * sum((h - Y).^2) + lambda * sum(abs(Theta));

  Error = Error - lambda * abs(Theta(1));
end
