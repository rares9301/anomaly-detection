function probability = gaussian_distribution(X, mean_value, variance)

  % Calculul diferenței dintre punctul de date și medie
  difference = X - mean_value;

  % Calculul inversului matricei de varianță
  inverse_variance = inv(variance);

  % Calculul exponentului
  exponent = -0.5 * (difference * inverse_variance * difference);

  % Calculul determinantului matricei de varianță
  determinant = det(variance);

  % Calculul probabilității
  probability = (1 / (sqrt(2 * pi * determinant))) * exp(exponent);

endfunction

