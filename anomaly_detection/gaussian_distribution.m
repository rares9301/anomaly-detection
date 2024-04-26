function probability = gaussian_distribution(X, mean_value, variance)

  % diferenta dintre date si medie
  difference = X - mean_value;

  % inversa matricei de varianta
  inverse_variance = inv(variance);

  % exponent
  exponent = -0.5 * (difference * inverse_variance * difference);

  % determinant matrice
  determinant = det(variance);

  % probabilitate
  probability = (1 / (sqrt((2 * pi)^n * determinant))) * exp(exponent);

endfunction

