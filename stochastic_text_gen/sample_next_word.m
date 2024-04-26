function probs = sample_next_word (text, words_idx, k_secv_idx, k, stoch)
  % ultima k-secv din text
  last_k_secv = strjoin(text(end-k+1:end), ' ');
  
  % Verifică dacă k-secvența există în k_secv_idx
  if isKey(k_secv_idx, last_k_secv)
    % exista? obtine indicele k-secventei 
    idx = k_secv_idx(last_k_secv);
    
    % ret probabilitai pentru k-secv
    probs = stoch(:, idx);
  else
    % secventa nu exista? ret zeros
    probs = zeros(size(stoch, 1), 1);
  endif
endfunction
