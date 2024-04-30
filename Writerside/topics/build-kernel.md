# build_kernel

Funcția este utilizată pentru a construi o matrice kernel, care este o componentă esențială în multi algoritmi de învățare automată, inclusiv în SVMs.

> **Functia nu depinde de alte functii**
{style="note"}

## Implementare


> function [K] = build_kernel (X, f, f_param)

Funcția va returna o matrice kernel `K`, care este calculată folosind o funcție kernel `f` și un parametru al acestei funcții `f_param`

1. determin numărul de `num_data` din setul de date `X`.

   ```C#
   num_data = size(X, 1);
   ```

2. inițializez matricea kernel `K` ca o matrice pătratică de dimensiune `num_data` x `num_data`

   ```C#
   K = zeros(num_data, num_data);
   ```
   
3. parcurg fiecare pereche de exemple de date pentru a calcula valorile kernel.

   ```C#
   for i = 1:num_data
    for j = 1:num_data
   ```

4. calculează valoarea kernel pentru perechea de exemple `i` și `j` folosind funcția kernel `f`

   ```C#
   K(i, j) = f(X(i, :), X(j, :), f_param);
   ```


## Cod sursa

   ```C#
   function [K] = build_kernel (X, f, f_param)
      % set size of matrix
      num_data = size(X, 1);

      % memory allocate
      K = zeros(num_data, num_data);

      % compute kernel values
      for i = 1:num_data
         for j = 1:num_data
            % kernal value for i <-> j
            K(i, j) = f(X(i, :), X(j, :), f_param);
         end
      end
   endfunction
   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}