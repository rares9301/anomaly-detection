function [a] = get_prediction_params (K, y, lambda)
  n = size(K, 1);
  L = cholesky(K + lambda * eye(n));  % cholesky
  Linv = get_lower_inverse(L);  % inverse
  a = Linv' * (Linv * y);  % rezolv sistemul liniar
endfunction
