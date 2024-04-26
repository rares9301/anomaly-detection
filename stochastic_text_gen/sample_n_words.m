function retval = sample_n_words (text, widx, kscvidx, k, stoch, word_set, n)
  for i = 1:n
    %  probabilities next word
    probs = sample_next_word(text, widx, kscvidx, k, stoch);
    
    % next word
    next_word = prob_choose(probs, word_set);
    
    % append next word
    text = [text, next_word];
  end
  
  retval = text;
endfunction
