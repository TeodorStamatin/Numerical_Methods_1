function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)

  [m n] = size(FeaturesMatrix);

  Theta = zeros(n, 1);

  FeatureMatrix = [ones(m, 1) FeaturesMatrix];

  r = FeaturesMatrix' * (FeaturesMatrix * Theta - Y);
  d = -r;

  err = norm(r);
  it = 0;

  while (err > tol && it < iter)

      alpha = (r' * r) / (d' * FeaturesMatrix' * FeaturesMatrix * d);

      Theta = Theta + alpha * d;
      r_prev = r;
      r = r + alpha * FeaturesMatrix' * (FeaturesMatrix * d);
      beta = (r' * r) / (r_prev' * r_prev);
      d = -r + beta * d;
      err = norm(r);
      it = it + 1;
  end

  if it >= iter
      Theta = zeros(size(FeaturesMatrix, 2), 1);
  end
  Theta = vertcat(zeros(1, size(Theta,2)), Theta);
  end