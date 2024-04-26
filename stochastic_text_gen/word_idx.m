function retval = word_idx (distinct_wds)
  % array de indici 1 -> len distinct_wds
  indices = num2cell(1:length(distinct_wds));
  
  % dictionar cu cheile distinct_wds
  retval = containers.Map(distinct_wds, indices);
endfunction
