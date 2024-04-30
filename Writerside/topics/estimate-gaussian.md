# estimate_gaussian

Această funcție este folosită pentru a estima parametrii unei distribuții gaussiene (normale) pentru un set de date `X`

> **Functia nu depinde de alte functii**
{style="note"}

## Implementare


> function [mean_values, variances] = estimate_gaussian(X)

Funcția estimate_gaussian va returna două valori: `mean_values` și `variances`, care sunt vectorii mediei și matricea de covarianță

1. Calculul fiecarei caracteristici (coloane) din setul de date X. Rezultatul este un vector `mean_vales` care contine media pentru fiecare caracteristica.

   ```C#
   mean_values = mean(X);
   ```

2. Calculul matriceai de covarianță a caracteristicilor din X. Elementele de pe diagonala principală a matricei reprezintă variantele fiecărei caracteristici.

   ```C#
   variances = cov(X);
   ```

## Cod sursa

   ```C#
   function [mean_values, variances] = estimate_gaussian(X)

   % Calculul mediei
   mean_values = mean(X);

   % Calculul matricei de varianta
   variances = cov(X);

   endfunction
   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}