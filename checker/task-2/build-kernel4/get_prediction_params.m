function [a] = get_prediction_params (K, y, lambda)
  n = size(K, 1);
  L = cholesky(K + lambda * eye(n));  % Descompunerea Cholesky
  Linv = get_lower_inverse(L);  % Inversa matricei L
  a = Linv' * (Linv * y);  % Rezolvarea sistemului liniar
endfunction
