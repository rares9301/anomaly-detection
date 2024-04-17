
function run_test()    
    fout = fopen("out", "w+");
    k = 2;
    corpus = split_input("../../input/task3/data/small_100_poe.txt");  
    _word_set = distinct_words(corpus);

    k_secv_corpus = k_secv(corpus, k);
    _k_secv_set = distinct_k_secv(k_secv_corpus);
    save("ouput.mat", "_k_secv_set", "_word_set")
    load("../../input/task3/ref/7_ref_poe_distinct_k_secv_and_distinct_words.mat")

    if isequal(_k_secv_set, k_secv_set) && isequal(_word_set, word_set)
        fprintf(fout, "1");
    else
        fprintf(fout, "0");
    endif
    fclose(fout);
endfunction