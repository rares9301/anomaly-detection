function [false_positives, false_negatives, true_positives] = check_predictions(predictions, truths)

  % Identificarea pozitivelor false
  false_positives = sum((predictions == 1) & (truths == 0));

  % Identificarea negativelor false
  false_negatives = sum((predictions == 0) & (truths == 1));

  % Identificarea pozitivelor adevărate
  true_positives = sum((predictions == 1) & (truths == 1));

endfunction

