
function run_test()    
    fout = fopen("out", "w+");

    k = 2;
    corpus = split_input("../../input/task3/data/small_100_poe.txt");  
    word_set = distinct_words(corpus);
    widx = word_idx(word_set);
    _wk = widx.keys;
    _wv = widx.values;

    save("ouput.mat", "_wk", "_wv")
    load("../../input/task3/ref/8_ref_poe_word_idx.mat")

    if isequal(wv, _wv) && isequal(wk, _wk)
        fprintf(fout, "1");
    else
        fprintf(fout, "0");
    endif
    fclose(fout);
endfunction