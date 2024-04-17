function [X_train, y_train, X_pred, y_pred] = split_dataset (X, y, percentage)
  % Split the dataset into training and prediction sets

  % Total number of data points
  num_data = size(X, 1);

  % Number of training data points
  num_train_data = round(percentage * num_data);

  % Indices for training data
  train_indices = 1:num_train_data;

  % Indices for prediction data
  pred_indices = num_train_data + 1:num_data;

  % Training data
  X_train = X(train_indices, :);
  y_train = y(train_indices);

  % Prediction data
  X_pred = X(pred_indices, :);
  y_pred = y(pred_indices);

endfunction
