# word_idx

Funcția este folosită pentru a crea un dicționar care asociază fiecare cuvânt unic dintr-un array cu un indice unic.

> **Functia nu depinde de alte functii**
{style="note"}

## Implementare


> function retval = word_idx (distinct_wds)

Funcția va returna un dicționar `retval` care mapează cuvintele la indici.

1. creez un array de celule indices care conține numerele de la 1 la lungimea array-ului `distinct_wds`, fiecare număr fiind convertit într-o celulă.
   ```C#
      indices = num2cell(1:length(distinct_wds));
   ```
   
2. creez un dicționar `retval` folosind obiectul `containers.Map`. Cuvintele unice din `distinct_wds` sunt folosite ca _chei_, iar indicii corespunzători din `indices` sunt folosiți ca _valori_.
   ```C#
      retval = containers.Map(distinct_wds, indices);
   ```

## Cod sursa

   ```C#
   function retval = word_idx (distinct_wds)
      % array de indici 1 -> len distinct_wds
      indices = num2cell(1:length(distinct_wds));
  
      % dictionar cu cheile distinct_wds
      retval = containers.Map(distinct_wds, indices);
   endfunction
   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}