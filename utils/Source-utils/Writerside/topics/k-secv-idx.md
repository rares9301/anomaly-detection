# k_secv_idx

Funcția este folosită pentru a crea un dicționar care asociază fiecare secvență distinctă de cuvinte dintr-un array cu un indice unic.

> **Functia nu depinde de alte functii**
{style="note"}

## Implementare

> function retval = k_secv_idx (distinct_k_sec)

Funcția va returna un dicționar `retval` care mapează secvențele de cuvinte la indici.

1. creez o listă de indici `indices` care conține numerele de la 1 până la lungimea array-ului `distinct_k_sec`.

   ```C#
      indices = 1:length(distinct_k_sec);
   ```

2. creez un dicționar `retval` folosind obiectul `containers.Map`. Secvențele unice din `distinct_k_sec` sunt folosite ca _chei_, iar indicii corespunzători din `indices` sunt folosiți ca _valori_.

   ```C#
   retval = containers.Map(distinct_k_sec, indices);
   ```

## Cod sursa

   ```C#
   function retval = k_secv_idx (distinct_k_sec)
      % listă de indici  1 la len distinct_k_sec
      indices = 1:length(distinct_k_sec);
  
      % dictionar cu cheile distinct_k_sec
      retval = containers.Map(distinct_k_sec, indices);
   endfunction
   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}