function [a] = get_prediction_params_iterative (K, y, lambda)
  % numarul de linii
  m = size(K, 1);

  % regularizez matricea K
  A = lambda * eye(m) + K;

  % intializez x0
  x0 = zeros(m, 1);

  % Setez toleranta
  tol = 1e-6;

  % numarul maxim de iteratii
  max_iter = 100;

  % aplic conjugatul
  a = conjugate_gradient(A, y, x0, tol, max_iter);

endfunction