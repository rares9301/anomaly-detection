function [outlier_values, outlier_indices] = identify_outliers(X, yval)
  % valori medii si matricea de varianta
  [mean_values, covariance_matrix] = estimate_gaussian(X);
  
  % probabilitati folosind multivariate
  probabilities = multivariate_gaussian(X, mean_values, covariance_matrix);
  
  % prag optim folosind scor F1
  [epsilon, F1, precision, recall] = optimal_threshold(yval, probabilities);
  
  % outliers
  outlier_values = find(probabilities < epsilon);
endfunction
