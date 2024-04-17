function probabilities = multivariate_gaussian(X, mean_values, variances)

  [m, n] = size(X); % Size of input matrix
  difference = bsxfun(@minus, X, mean_values); % Differences from the mean
  inverse_variance = inv(variances); % Inverse of variance matrix
  determinant = det(variances); % Determinant of variance matrix

  % Calculate exponent
  exponent = -0.5 * sum((difference * inverse_variance) .* difference, 2);

  % Calculate probabilities
  probabilities = (1 / (sqrt((2 * pi)^n * determinant))) * exp(exponent);

endfunction

