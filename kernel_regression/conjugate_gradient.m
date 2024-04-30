function [x] = conjugate_gradient_optimized(A, b, x0, tol, max_iter)
  % initializez variabile
  r = b - A * x0; % reziduu
  v = r;          % dirctie de cautare
  x = x0;         % solutie
  tol_sq = tol^2; % toleranta^2 (eficientizare)
  k = 0;          % contor

  % pre-calculez prod scalar al reziduului inital
  rho = r' * r;

  % Iterez pana la convergenta sau max_iter
  while k < max_iter && rho > tol_sq
    Av = A * v;
    alpha = rho / (v' * Av);
    x = x + alpha * v; % actualizez solutia
    r = r - alpha * Av; % actualizez reziduu
    rho_new = r' * r;   % Calculeaza noul produs scalar al reziduului
    beta = rho_new / rho;
    v = r + beta * v;   % actualizez directia de cautare
    rho = rho_new;      % actualizez produsul scalar al reziduului
    k = k + 1;          % incrementez contor
  end
end
