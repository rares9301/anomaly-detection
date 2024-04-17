function retval = gaussian_kernel (x, y, sigma)
  % Implement Gaussian kernel function 

  squared_distance = sum((x - y).^2); 
  retval = exp(-squared_distance / (2 * sigma^2));
endfunction
