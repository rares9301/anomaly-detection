# multivariate_gaussian

Aceasta functie este folosita pentru a calcula probabilitățile unui set de date `X` sub o distribuție gaussiană multivariată, dată prin valorile medii `mean_values` și matricea de covarianță `variances`.

> **Functia nu depinde de alte functii si este asemanatoare functiei `gaussian_distribution`. Pentru simplitate, voi explica doar functia `multivariate_gaussian`**
{style="note"}

![multivariate_gaussian](multivairate.png){ width=330 }{style="block" border-effect=rounded}

## Implementare


>  function probabilities = multivariate_gaussian(X, mean_values, variances)

Funcția va returna un vector `probabilities` care conține probabilitățile pentru fiecare exemplu din `X`.

1. obțin dimensiunea matricei `X`, unde m reprezintă numărul de exemple și n numărul de caracteristici.

   ```C#
     [m, n] = size(X);
   ```

2. calculez diferența dintre fiecare exemplu din `X` și vectorul mediei `mean_values`.

   ```C#
   difference = bsxfun(@minus, X, mean_values)
   ```
   
3. calculez inversa matricei de covarianță `variances`.

   ```C#
   inverse_variance = inv(variances);
   ```

4. calculez determinantul matricei de covarianță `variances`.

   ```C#
   determinant = det(variances);
   ```
   
5. calculez exponentul pentru funcția de densitate a probabilității, care este o parte esențială a ecuației pentru distribuția gaussiană multivariată.
   
   ```C#
   exponent = -0.5 * sum((difference * inverse_variance) .* difference, 2);
   ```

6. calculez probabilitățile pentru fiecare exemplu din `X`, folosind formula pentru distribuția gaussiană multivariată.

   ```C#
   probabilities = (1 / (sqrt((2 * pi)^n * determinant))) * exp(exponent);
   ```

## Cod sursa

   ```C#
   function probabilities = multivariate_gaussian(X, mean_values, variances)

   [m, n] = size(X); % matrix size
   difference = bsxfun(@minus, X, mean_values); % diff from mean
   inverse_variance = inv(variances); % inverse of matrix
   determinant = det(variances); % determinant

   % exponent
   exponent = -0.5 * sum((difference * inverse_variance) .* difference, 2);

   % probabilitati
   probabilities = (1 / (sqrt((2 * pi)^n * determinant))) * exp(exponent);

endfunction
   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}