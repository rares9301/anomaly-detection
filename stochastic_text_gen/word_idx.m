function retval = word_idx (distinct_wds)
  % Crează un array de indici de la 1 la lungimea lui distinct_wds
  indices = num2cell(1:length(distinct_wds));
  
  % Crează un dicționar cu cheile distinct_wds și valorile indices
  retval = containers.Map(distinct_wds, indices);
endfunction
