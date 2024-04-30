# optimal_threshold

Funcția este concepută pentru a găsi valoarea optimă a pragului (epsilon) care maximizează scorul F1 într-un context de clasificare binară.

> **Functia apeleaza `check_predictions` si `metrics`**
{style="warning"}

## Prerequisites

Urmatoarele functii sunt necesare pentru rezolvarea task-ului:
- check_predictions
   ```C#
   function [false_positives, false_negatives, true_positives] = check_predictions(predictions, truths)

      % false pozitives
      false_positives = sum((predictions == 1) & (truths == 0));

      % false negatives
      false_negatives = sum((predictions == 0) & (truths == 1));

      % true positives
      true_positives = sum((predictions == 1) & (truths == 1));

      endfunction
   ```
  {collapsible="true" default-state="collapsed" collapsed-title-line-number="1"}
- metrics
   ```C#
   function [precision, recall, F1] = metrics(true_positives, false_positives, false_negatives)
       % precizie
       precision = true_positives / (true_positives + false_positives);

        % recall
       recall = true_positives / (true_positives + false_negatives);

       % F1 score
       F1 = 2 * (precision * recall) / (precision + recall);
    endfunction
  ```
  {collapsible="true" default-state="collapsed" collapsed-title-line-number="1"}

## Implementare


>  function [best_epsilon, best_F1, associated_precision, associated_recall] = optimal_threshold(truths, probabilities)

Funcția va returna valoarea optimă a pragului `best_epsilon`, cel mai bun scor F1 (`best_F1`), `associated_precision` și `associated_recall` asociate cu acest prag.

1. initializez rata de recall.

   ```C#
         best_epsilon = 0;
         best_F1 = 0;
         associated_precision = 0;
         associated_recall = 0;

   ```

2. setez `stepsize` si creez un vector `epsilons` cu aceste valori

   ```C#
      stepsize = (max(probabilities) - min(probabilities)) / 1000;
      epsilons = min(probabilities):stepsize:max(probabilities);

      ```

3. pentru fiecare valoare a lui `epsilon`, se generează un vector de predicții binare, unde probabilitățile mai mici decât epsilon sunt considerate pozitive (1), iar celelalte negative (0).

   ```C#
       for epsilon = epsilons
            predictions = probabilities < epsilon;

   ```

4. calculez predictiile.

   ```C#
   [false_positives, false_negatives, true_positives] = check_predictions(predictions, truths);
   ```

5. calcula precizia, rata de recall și scorul F1

   ```C#
    [precision, recall, F1] = metrics(true_positives, false_positives, false_negatives)

   ```

6. Dacă scorul F1 calculat pentru o anumită valoare a lui epsilon este mai mare decât cel mai bun scor F1 găsit până în acel moment, atunci valorile asociate cu acesta sunt actualizate ca fiind cele mai bune.

   ```C#
           if F1 > best_F1
            best_F1 = F1;
            best_epsilon = epsilon;
            associated_precision = precision;
            associated_recall = recall;
   end
   
   ```

## Cod sursa

   ```C#
   function [best_epsilon, best_F1, associated_precision, associated_recall] = optimal_threshold(truths, probabilities)
    best_epsilon = 0;
    best_F1 = 0;
    associated_precision = 0;
    associated_recall = 0;

    stepsize = (max(probabilities) - min(probabilities)) / 1000;
    epsilons = min(probabilities):stepsize:max(probabilities);

    for epsilon = epsilons
        predictions = probabilities < epsilon;
        [false_positives, false_negatives, true_positives] = check_predictions(predictions, truths);
        [precision, recall, F1] = metrics(true_positives, false_positives, false_negatives)

        if F1 > best_F1
            best_F1 = F1;
            best_epsilon = epsilon;
            associated_precision = precision;
            associated_recall = recall;
        end
    endfor
endfunction
   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}