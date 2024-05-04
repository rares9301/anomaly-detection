# distinct_k_secv

Funcția este folosită pentru a elimina duplicatele dintr-un cell array `cell_array`, lăsând doar elementele unice.

> **Functia nu depinde de alte functii**
{style="note"}

## Implementare


> function unique_cell_array = distinct_k_secv (cell_array)

Funcția va returna un cell array `unique_cell_array` care conține elementele unice din `cell_array`.

1. aplic funcția `unique` direct pe `cell_array` pentru a obține elementele unice, care sunt apoi stocate în `unique_cell_array`.
   ```C#
      unique_cell_array = unique(cell_array);
   ```

## Cod sursa

   ```C#
   function unique_cell_array = distinct_k_secv (cell_array)
      % unique
      unique_cell_array = unique(cell_array);
   endfunction
   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}