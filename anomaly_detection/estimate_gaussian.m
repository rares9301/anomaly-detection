% This function estimates the parameters of a Gaussian distribution using the data in X.
function [mean_values, variances] = estimate_gaussian(X)

  % Calculul mediei
  mean_values = mean(X);

  % Calculul matricei de varianță
  variances = cov(X);

endfunction

