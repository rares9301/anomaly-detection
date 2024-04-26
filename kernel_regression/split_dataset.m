function [X_train, y_train, X_pred, y_pred] = split_dataset (X, y, percentage)
  % total data points
  num_data = size(X, 1);

  % round 
  num_train_data = round(percentage * num_data);

  % indices for training
  train_indices = 1:num_train_data;

  % indices for preds
  pred_indices = num_train_data + 1:num_data;

  % training data
  X_train = X(train_indices, :);
  y_train = y(train_indices);

  % prediction data
  X_pred = X(pred_indices, :);
  y_pred = y(pred_indices);

endfunction
