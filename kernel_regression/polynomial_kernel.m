function retval = polynomial_kernel (x, y, d)
  % Implement polynomial kernel function

  retval = (1 + dot(x, y))^d; 
endfunction
