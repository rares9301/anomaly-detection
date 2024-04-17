## DO NOT MODIFY
function is_punc = punctuation (input)
  is_punc = input == ',' || input == '.' || input == '?' || input == ';' || input == ':' || input == '\' || input=='(' || input == ')' || input == '!' || input == '"' || input == "'" || input == '-';
endfunction
