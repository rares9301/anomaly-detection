function retval = polynomial_kernel (x, y, d)
  % kernel polynomial

  retval = (1 + dot(x, y))^d; 
endfunction
