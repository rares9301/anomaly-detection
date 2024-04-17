function retval = sample_n_words (text, widx, kscvidx, k, stoch, word_set, n)
  % Sample word using sample_next_word from the last k elements of text (k-seq), add it to the end of text
  % repeat n times
  for i = 1:n
    % Get probabilities for the next word
    probs = sample_next_word(text, widx, kscvidx, k, stoch);
    
    % Choose the next word based on the probabilities
    next_word = prob_choose(probs, word_set);
    
    % Append the next word to the text
    text = [text, next_word];
  end
  
  retval = text;
endfunction
