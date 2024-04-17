function L = cholesky(A)
  [n, m] = size(A);
  if n ~= m
    error('Matrix must be square');
  end
  L = zeros(n); 

  for i = 1:n 
    L(i, i) = sqrt(A(i, i) - dot(L(i, 1:i-1), L(i, 1:i-1)));
    for j = i+1:n
        L(j, i) = (A(j, i) - dot(L(i, 1:i-1), L(j, 1:i-1))) / L(i, i);
    end
  end
endfunction
