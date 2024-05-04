# distinct_words

Funcția este folosită pentru a returna o listă de cuvinte unice dintr-un vector de tokeni `tokens`.

> **Functia nu depinde de alte functii**
{style="note"}

## Implementare

> function retval = distinct_words(tokens)

Funcția va returna un vector `retval` care conține tokenii unici.

- sortez vectorul de tokeni `tokens` și apoi aplic funcția `unique` pentru a elimina duplicatele, rezultând într-un vector de tokeni unici `retval`.

   ```C#
   retval = unique(sort(tokens));
   ```

## Cod sursa

   ```C#
   function retval = distinct_words(tokens)
      % sort unique
      retval = unique(sort(tokens));
   endfunction

   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}