function B = k_secv (A, k)
  B = {};
  for i = 1:length(A)-k
    B{end+1} = strjoin(A(i:i+k-1), ' ');
  endfor
  B = B';  
endfunction