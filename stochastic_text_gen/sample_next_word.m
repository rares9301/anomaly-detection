function probs = sample_next_word (text, words_idx, k_secv_idx, k, stoch)
  % Obține ultima k-secvență din text
  last_k_secv = strjoin(text(end-k+1:end), ' ');
  
  % Verifică dacă k-secvența există în k_secv_idx
  if isKey(k_secv_idx, last_k_secv)
    % Dacă există, obține indicele k-secvenței
    idx = k_secv_idx(last_k_secv);
    
    % Returnează probabilitățile corespunzătoare k-secvenței
    probs = stoch(:, idx);
  else
    % Dacă k-secvența nu există în k_secv_idx, returnează un vector de zerouri
    probs = zeros(size(stoch, 1), 1);
  endif
endfunction
