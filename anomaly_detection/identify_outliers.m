function [outlier_values, outlier_indices] = identify_outliers(X, yval)
  % Estimează valorile medii și matricea de covarianță
  [mean_values, covariance_matrix] = estimate_gaussian(X);
  
  % Calculează probabilitățile folosind distribuția gaussiană multivariată
  probabilities = multivariate_gaussian(X, mean_values, covariance_matrix);
  
  % Determină pragul optim folosind scorul F1
  [epsilon, F1, precision, recall] = optimal_threshold(yval, probabilities);
  
  % Găsește outlierii pe baza acestor probabilități
  outlier_values = find(probabilities < epsilon);
endfunction
