# get_prediction_params_iter

Funcția este folosită pentru a calcula parametrii de predicție într-un mod iterativ, folosind metoda gradientului conjugat.

> **Functia apeleaza `conjugate_gradient`**
{style="warning"}

## Prerequisites

Urmatoarele functii sunt necesare pentru rezolvarea task-ului:
- conjugate_gradient
 ```C#
   function [x] = conjugate_gradient_optimized(A, b, x0, tol, max_iter)
        % initializez variabile
         r = b - A * x0; % reziduu
        v = r;           % dirctie de cautare
        x = x0;          % solutie
        tol_sq = tol^2;  % toleranta^2 (eficientizare)
        k = 0;           % contor

        % pre-calculez prod scalar al reziduului inital
        rho = r' * r;

        % Iterez pana la convergenta sau max_iter
        while k < max_iter && rho > tol_sq
            Av = A * v;
            alpha = rho / (v' * Av);
            x = x + alpha * v;  % actualizez solutia
            r = r - alpha * Av; % actualizez reziduu
            rho_new = r' * r;   % noul produs scalar al reziduului
            beta = rho_new / rho;
            v = r + beta * v;   % actualizez directia de cautare
            rho = rho_new;      % actualizez produsul scalar al reziduului
            k = k + 1;          % incrementez contor
        end
    end

   ```
  {collapsible="true" default-state="expanded" collapsed-title-line-number="1"}

## Implementare


>  function [a] = get_prediction_params_iterative (K, y, lambda)

Funcția va returna un vector `a` care conține parametrii de predicție calculați.

1. determin numărul de linii din matricea kernel `K`

   ```C#
         m = size(K, 1);

   ```

2. regularizez matricea kernel `K` prin adăugarea produsului dintre `lambda` și matricea identitate `eye(m)` la `K`, rezultând matricea `A`

   ```C#
      A = lambda * eye(m) + K;

      ```

3. inițializez vectorul de start x0 pentru algoritmul iterativ, setând toate valorile la zero.

   ```C#
       x0 = zeros(m, 1);

   ```

4. setez toleranta

   ```C#
   tol = 1e-6;
   ```

5. setez un număr maxim de iterații `max_iter` pentru algoritmul iterativ.

   ```C#
    max_iter = 100;

   ```

6. aplic metoda gradientului conjugat pentru a rezolva sistemul liniar
   ```C#
    a = conjugate_gradient(A, y, x0, tol, max_iter);
   ```

## Cod sursa

   ```C#
  function [a] = get_prediction_params_iterative (K, y, lambda)
        % numarul de linii
        m = size(K, 1);

        % regularizez matricea K
        A = lambda * eye(m) + K;

        % intializez x0
        x0 = zeros(m, 1);

        % Setez toleranta
        tol = 1e-6;

        % numarul maxim de iteratii
        max_iter = 100;

        % aplic conjugatul
        a = conjugate_gradient(A, y, x0, tol, max_iter);
    endfunction
   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}