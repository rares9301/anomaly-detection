function probabilities = multivariate_gaussian(X, mean_values, variances)

  [m, n] = size(X); % matrix size
  difference = bsxfun(@minus, X, mean_values); % diff from mean
  inverse_variance = inv(variances); % inverse of matrix
  determinant = det(variances); % determinant

  % exponent
  exponent = -0.5 * sum((difference * inverse_variance) .* difference, 2);

  % probabilitati
  probabilities = (1 / (sqrt((2 * pi)^n * determinant))) * exp(exponent);

endfunction

