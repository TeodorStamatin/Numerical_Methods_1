function [J, grad] = cost_function(params, X, y, lambda, ...
  input_layer_size, hidden_layer_size, ...
  output_layer_size)

    Theta1 = reshape(params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
    Theta2 = reshape(params((1 + (hidden_layer_size * (input_layer_size + 1))):end), output_layer_size, (hidden_layer_size + 1));

    m = size(X, 1);
    a1 = [ones(m, 1) X];
    z2 = a1 * Theta1';
    a2 = [ones(m, 1) sigmoid(z2)];
    z3 = a2 * Theta2';
    a3 = sigmoid(z3);
    h = a3;

    Y = eye(output_layer_size)(y,:);

    delta3 = a3 - Y;
    delta2 = delta3 * Theta2(:, 2:end) .* (sigmoid(z2) .* (1 - sigmoid(z2)));

    grad_T1 = delta2' * a1 / m;
    grad_T2 = delta3' * a2 / m;

    J = -sum(sum(Y .* log(h) + (1 - Y) .* log(1 - h))) / m + (lambda / (2 * m)) * (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2)));

    grad_T1(:,2:end) = grad_T1(:,2:end) + (lambda / m) * Theta1(:,2:end);
    grad_T2(:,2:end) = grad_T2(:,2:end) + (lambda / m) * Theta2(:,2:end);

    grad = [grad_T1(:) ; grad_T2(:)];
  end
  