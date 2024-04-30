# cholesky

Descompunerea Cholesky este o metodă de factorizare a unei matrice simetrice pozitiv definite în produsul unei matrice inferioare triunghiulare și transpusa sa.

> **Functia nu depinde de alte functii**
{style="note"}

## Implementare


> function L = cholesky(A)

Funcția va returna o matrice triunghiulară inferioară `L` caracteristica descompunerii Cholesky

1. determin dimensiunea matricei `A` și initializez matricea `L` ca o matrice pătratică de dimensiune `n` x `n`

   ```C#
      [n, m] = size(A);
      L = zeros(n);
   ```

2. calculez elementele diagonale ale matricei `L` folosind rădăcina pătrată a diferenței dintre elementul corespunzător din `A` și suma pătratelor elementelor anterioare din aceeași linie.

   ```C#
   for i = 1:n 
      L(i, i) = sqrt(A(i, i) - dot(L(i, 1:i-1), L(i, 1:i-1)));
   ```

3. calculez elementele non-diagonale ale matricei `L` prin scăderea produsului scalar al elementelor anterioare din linia `i` și coloana `j` și împărțirea rezultatului la elementul diagonal curent din `L`

   ```C#
   for j = i+1:n
        L(j, i) = (A(j, i) - dot(L(i, 1:i-1), L(j, 1:i-1))) / L(i, i);
   ```

## Cod sursa

   ```C#
   function L = cholesky(A)
      [n, m] = size(A);
      L = zeros(n); 

      for i = 1:n 
         L(i, i) = sqrt(A(i, i) - dot(L(i, 1:i-1), L(i, 1:i-1)));
         for j = i+1:n
            L(j, i) = (A(j, i) - dot(L(i, 1:i-1), L(j, 1:i-1))) / L(i, i);
         end
      end
   endfunction

   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}