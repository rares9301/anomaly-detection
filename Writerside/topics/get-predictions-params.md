# get_prediction_params

Funcția este folosită pentru a calcula parametrii de predicție pentru un model de învățare automată, dată o matrice kernel `K`, un vector de etichete `y` și un parametru de regularizare `lambda`.

> **Functia apeleaza functia `cholesky`**
{style="warning"}

## Prerequisites

Urmatoarele functii sunt necesare pentru rezolvarea task-ului:
- [cholesky](cholesky.md)

## Implementare

> function [a] = get_prediction_params (K, y, lambda)

Funcția va returna un vector a care conține parametrii de predicție.

1. determin dimensiunea matricei kernel `K`

   ```C#
     n = size(K, 1);
   ```

2. Se adaugă regularizare la matricea kernel `K` prin adăugarea produsului dintre `lambda` și matricea identitate `eye(n)` la `K`. Apoi se aplică descompunerea `Cholesky` pentru a obține o matrice triunghiulară inferioară `L`.

   ```C#
      L = cholesky(K + lambda * eye(n));
   ```

3. calculez inversa matricei triunghiulare inferioare `L`.

   ```C#
   Linv = get_lower_inverse(L);
   ```

4. rezolv sistemul liniar pentru a obține parametrii de predicție `a`. Acest lucru se face prin înmulțirea transpusei matricei inverse `Linv'` cu rezultatul înmulțirii matricei inverse `Linv` cu vectorul de etichete `y`.

   ```C#
   a = Linv' * (Linv * y);
   ```


## Cod sursa

   ```C#
   function [a] = get_prediction_params (K, y, lambda)
      n = size(K, 1);
      L = cholesky(K + lambda * eye(n));  % cholesky
      Linv = get_lower_inverse(L);  % inverse
      a = Linv' * (Linv * y);  % rezolv sistemul liniar
   endfunction
   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}