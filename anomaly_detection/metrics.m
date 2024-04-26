function [precision, recall, F1] = metrics(true_positives, false_positives, false_negatives)
  % precizie
  precision = true_positives / (true_positives + false_positives);

  % recall
  recall = true_positives / (true_positives + false_negatives);

  % F1 score
  F1 = 2 * (precision * recall) / (precision + recall);
endfunction
