function [precision, recall, F1] = metrics(true_positives, false_positives, false_negatives)
  % Calculate precision
  precision = true_positives / (true_positives + false_positives);

  % Calculate recall
  recall = true_positives / (true_positives + false_negatives);

  % Calculate F1 score
  F1 = 2 * (precision * recall) / (precision + recall);
endfunction
