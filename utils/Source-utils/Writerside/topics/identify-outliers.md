# identify_outliers

Funcția este utilizată pentru a identifica valorile **outliers** dintr-un set de date X, folosind valorile etichetate `yval`

> **Functia apeleaza `estimate_gaussian`, `multivariate_gaussians` si `optimal_threshold`**
{style="warning"}

## Prerequisites

Urmatoarele functii sunt necesare pentru rezolvarea task-ului:
- [estimate_gaussian](estimate-gaussian.md)
- [multivariate_gaussian](multivariate-gaussian.md)
- [optimal_threshold](optimal-threshold.md)

## Implementare


>  function [outlier_values, outlier_indices] = identify_outliers(X, yval)

Funcția va returna valorile outliers (`outlier_values`) și indicii acestora (`outlier_indices`) în setul de date `X`.

1. calculez valorile medii și matricea de covarianță pentru setul de date X

   ```C#
         [mean_values, covariance_matrix] = estimate_gaussian(X);

   ```

2. calculez probabilitățile fiecărui exemplu din X de a fi generat de o distribuție gaussiană multivariată,

   ```C#
      probabilities = multivariate_gaussian(X, mean_values, covariance_matrix);

      ```

3. determin valoarea optimă a pragului (`epsilon`) care maximizează scorul `F1`, folosind valorile etichetate `yval` și probabilitățile calculate.

   ```C#
       [epsilon, F1, precision, recall] = optimal_threshold(yval, probabilities);

   ```

4. identific outliers.

   ```C#
   outlier_indices = find(probabilities < epsilon);
   ```

## Cod sursa

   ```C#
   function [outlier_values, outlier_indices] = identify_outliers(X, yval)
      % valori medii si matricea de varianta
      [mean_values, covariance_matrix] = estimate_gaussian(X);
  
      % probabilitati folosind multivariate
      probabilities = multivariate_gaussian(X, mean_values, covariance_matrix);
  
      % prag optim folosind scor F1
      [epsilon, F1, precision, recall] = optimal_threshold(yval, probabilities);
  
      % outliers
      outlier_values = find(probabilities < epsilon);
   endfunction

   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}