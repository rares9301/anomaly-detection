
function run_test()    
    fout = fopen("out", "w+");
    k = 2;
    corpus = split_input("../../input/task3/data/small_100_poe.txt");  
    word_set = distinct_words(corpus);
    k_secv_corpus = k_secv(corpus, k);
    k_secv_set = distinct_k_secv(k_secv_corpus);
    widx = word_idx(word_set);
    _wk = widx.keys;
    _wv = widx.values;
    kscvidx = k_secv_idx(k_secv_set);
    _kk = kscvidx.keys;
    _kv = kscvidx.values;

    save("ouput.mat", "_wk", "_wv", "_kk", "_kv")
    load("../../input/task3/ref/9_ref_poe_word_idx_and_k_secv_idx.mat")

    if isequal(wv, _wv) && isequal(wk, _wk) && isequal(kk, _kk) && isequal(kv, _kv)
        fprintf(fout, "1");
    else
        fprintf(fout, "0");
    endif
    fclose(fout);
endfunction