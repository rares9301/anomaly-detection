function retval = stochastic_matrix(k_secv_corpus, corpus_words, words_idx, k_secv_idx, k)
  % Obține indicii pentru k-secvențe și cuvinte
  k_secv_indices = cellfun(@(x) k_secv_idx(x), k_secv_corpus);
  word_indices = cellfun(@(x) words_idx(x), corpus_words(k+1:end));
  
  % Inițializează matricea ca o matrice goală
  retval = zeros(length(words_idx), length(k_secv_idx));
  
  % Adaugă 1 la elementul corespunzător din matrice pentru fiecare pereche de k-secvență și cuvânt
  for i = 1:length(k_secv_indices)
    retval(word_indices(i), k_secv_indices(i)) += 1;
  endfor
endfunction