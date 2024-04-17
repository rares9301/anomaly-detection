function retval = distinct_words(tokens)
  % Sortează și returnează cuvinte unice din vectorul de cuvinte 'tokens'
  retval = unique(sort(tokens));
endfunction
