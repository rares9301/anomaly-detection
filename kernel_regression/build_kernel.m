function [K] = build_kernel (X, f, f_param)
  % set size of matrix
  num_data = size(X, 1);

  % memory allocate
  K = zeros(num_data, num_data);

  % compute kernel values
  for i = 1:num_data
    for j = 1:num_data
      % kernal value for i <-> j
      K(i, j) = f(X(i, :), X(j, :), f_param);
    end
  end

endfunction
