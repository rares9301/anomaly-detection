function [precision, recall, F1] = metrics(true_positives, false_positives, false_negatives)
  % Small constant to prevent division by zero
  eps = 1e-10;

  % Calculate precision
  precision = true_positives / (true_positives + false_positives + eps);

  % Calculate recall
  recall = true_positives / (true_positives + false_negatives + eps);

  % Calculate F1 score
  F1 = 2 * (precision * recall) / (precision + recall + eps);
endfunction
