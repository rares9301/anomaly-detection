function pred = eval_value(x, X, f, f_param, a)
  n = size(X, 1);
  K = zeros(n, 1);
  for i = 1:n
    K(i) = f(X(i, :), x, f_param);
  end
  pred = a' * K;
endfunction
