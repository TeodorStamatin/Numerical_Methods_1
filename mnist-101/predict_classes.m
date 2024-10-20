function [classes] = predict_classes(X, weights, input_layer_size, hidden_layer_size, output_layer_size)

  classes = zeros(size(X,1),1);

  for i=1:size(X,1)

      example = X(i,:);

      [a1, z2, a2, z3, h] = forward_propagation(example, weights, input_layer_size, hidden_layer_size, output_layer_size);

      [~, class] = max(h);

      classes(i) = class;
  end
  
  end
  
  function [a1, z2, a2, z3, h] = forward_propagation(X, weights, input_layer_size, hidden_layer_size, output_layer_size)

  X = X(:);

  W1 = reshape(weights(1:hidden_layer_size*(input_layer_size+1)), hidden_layer_size, input_layer_size+1);

  W2 = reshape(weights(hidden_layer_size*(input_layer_size+1)+1:end), output_layer_size, hidden_layer_size+1);

  a1 = [1; X];
  z2 = W1 * a1;
  a2 = sigmoid(z2);
  a2 = [1; a2];
  z3 = W2 * a2;
  h = sigmoid(z3);
  
  end
  
  function g = sigmoid(z)

  g = 1./(1+exp(-z));
  
  end
  