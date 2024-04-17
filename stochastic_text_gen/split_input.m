function tokens = split_input (filePath)
  fid = fopen(filePath, 'r');
  rough_tokens = textscan(fid, '%s'){1,1};
  tokens = {};
  for tok_ind = 1:size(rough_tokens)(1)
    tok = rough_tokens{tok_ind};
    if size(tok)(2) == 0
      continue
    endif
    if size(tok)(2) == 1
      tokens{end+1} = tok;
      continue
    endif
    if punctuation(tok(1))
      tokens{end+1} = tok(1:1);
      tokens{end+1} = tok(2:end);
    elseif punctuation(tok(end))
      tokens{end+1} = tok(1:end-1);
      tokens{end+1} = tok(end:end);
     else
      tokens{end+1} = tok;
    endif
  endfor
  tokens = tokens';
endfunction
