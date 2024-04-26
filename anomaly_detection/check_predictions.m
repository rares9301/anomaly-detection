function [false_positives, false_negatives, true_positives] = check_predictions(predictions, truths)

  % false pozitives
  false_positives = sum((predictions == 1) & (truths == 0));

  % false negatives
  false_negatives = sum((predictions == 0) & (truths == 1));

  % true positives
  true_positives = sum((predictions == 1) & (truths == 1));

endfunction

