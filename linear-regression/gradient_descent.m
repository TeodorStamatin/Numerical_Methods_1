function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)

  Theta = zeros(n+1, 1);
  FeatureMatrix = [zeros(m, 1), FeatureMatrix];

  for i = 1:iter

      hypothesis = FeatureMatrix * Theta;
      
      diff = hypothesis - Y;

      gradient = (alpha/m) * (FeatureMatrix' * diff);

      Theta = Theta - gradient;
  end
end
  