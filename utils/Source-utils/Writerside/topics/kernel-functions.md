# kernel_functions

Rolul acestor kernel-uri este de a ne oferi o modalitate de a estima parametri necesari in functie
de gradul maxim (din punct de vedere polinomial) pe care il atribuim functiei ϕ. 

> **Am implementat 3 tipuri de kernel-uri**
{style="note"}

## Kernels


- Linear Kernel

  <code-block lang="tex">
    \begin{equation}
    K(x,y) = y^T*x
    \end{equation}
   </code-block>
  
```C#
   function retval = linear_kernel(x, y, other)
      % ignore 'other' parameter
      retval = dot(x, y);
   endfunction
   ```
  {collapsible="true" default-state="expanded" collapsed-title-line-number="1"}

- Polynomial Kernel

   <code-block lang="tex">
    \begin{equation}
    K(x,y) = (1+y^T*x)^d
    \end{equation}
   </code-block>  
  
```C#
      function retval = polynomial_kernel (x, y, d)
         % kernel polynomial
         retval = (1 + dot(x, y))^d; 
      endfunction
  ```
  {collapsible="true" default-state="expanded" collapsed-title-line-number="1"}

- Gaussian/Radial - Basis Kernel

   <code-block lang="tex">
    \begin{equation}
      K(x, y) = \exp\left(-\frac{\|x - y\|_2^2}{2\sigma^2}\right)
    \end{equation}
   </code-block>

```C#
      function retval = gaussian_kernel (x, y, sigma)
         squared_distance = sum((x - y).^2); 
         retval = exp(-squared_distance / (2 * sigma^2));
      endfunction

  ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}
