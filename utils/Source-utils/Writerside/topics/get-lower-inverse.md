# get_lower_inverse

Funcția este folosită pentru a calcula inversa unei matrice triunghiulare inferioare L.

> **Functia nu depinde de alte functii**
{style="note"}

## Implementare


> function P = get_lower_inverse(L)

Funcția va returna matricea `P`, care este inversa matricei triunghiulare inferioare `L`.

1. determin dimensiunea matricei `L` și se inițializez matricea `P` ca o matrice identitate de dimensiune `n` x `n`.

   ```C#
      n = size(L, 1);
      P = eye(n);

   ```

2. calculez elementele diagonale ale matricei `P` prin inversarea elementelor diagonale ale matricei `L`.

   ```C#
   for j = 1:n
        P(j, j) = 1 / L(j, j);
   ```

3. Calculez elementele sub diagonala 1 ale matricei `P`. Pentru fiecare element `P(i, j)`, se înmulțește secțiunea corespunzătoare a liniei `i` din `L` cu coloana `j` din `P` (până la elementul `i-1`), 
se negativizează rezultatul și se împarte la elementul diagonal `L(i, i)`.

   ```C#
   for i = j+1:n
      P(i, j) = -L(i, j:i-1) * P(j:i-1, j) / L(i, i);
   ```

## Cod sursa

   ```C#
   function P = get_lower_inverse(L)
      n = size(L, 1);
      P = eye(n);
      for j = 1:n
         P(j, j) = 1 / L(j, j);
         for i = j+1:n
              P(i, j) = -L(i, j:i-1) * P(j:i-1, j) / L(i, i);
         end
      end
   end

   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}