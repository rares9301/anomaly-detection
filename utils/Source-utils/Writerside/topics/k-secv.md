# k_secv

Funcția este folosită pentru a genera toate secvențele posibile de lungime `k` dintr-un vector de cuvinte `A`.

> **Functia nu depinde de alte functii**
{style="note"}

## Implementare


> function B = k_secv (A, k)

Funcția va returna un cell array `B` care conține secvențele de cuvinte.

1. Se iterează prin vectorul de cuvinte `A`, de la primul cuvânt pana la `length(A)-k`. Se creează o secvență de `k` cuvinte și se adaugă la cell array-ul `B`.

   ```C#
      for i = 1:length(A)-k
         B{end+1} = strjoin(A(i:i+k-1), ' ');
      endfor
   ```

2. transpun `B` pentru a avea un format coloană.

   ```C#
   B = B'; 
   ```

## Cod sursa

   ```C#
   function B = k_secv (A, k)
      B = {};
      for i = 1:length(A)-k
         B{end+1} = strjoin(A(i:i+k-1), ' ');
      endfor
      B = B';  
   endfunction
   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}