function [K] = build_kernel (X, f, f_param)
  % Build the kernel matrix

  % Number of data points
  num_data = size(X, 1);

  % Allocate memory for the kernel matrix
  K = zeros(num_data, num_data);

  % Calculate kernel values for all pairs of data points
  for i = 1:num_data
    for j = 1:num_data
      % Calculate kernel value between i-th and j-th data points
      K(i, j) = f(X(i, :), X(j, :), f_param);
    end
  end

endfunction
