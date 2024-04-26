function [mean_values, variances] = estimate_gaussian(X)

  % Calculul mediei
  mean_values = mean(X);

  % Calculul matricei de varianta
  variances = cov(X);

endfunction

