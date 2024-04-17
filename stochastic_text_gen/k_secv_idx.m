function retval = k_secv_idx (distinct_k_sec)
  % Crează o listă de indici de la 1 la lungimea lui distinct_k_sec
  indices = 1:length(distinct_k_sec);
  
  % Crează un dicționar cu cheile distinct_k_sec și valorile indices
  retval = containers.Map(distinct_k_sec, indices);
endfunction
