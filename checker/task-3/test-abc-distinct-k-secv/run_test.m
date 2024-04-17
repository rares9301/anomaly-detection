
function run_test()    
    fout = fopen("out", "w+");
    k = 2;
    corpus = split_input("../../input/task3/data/x_abc.txt");  
    k_secv_corpus = k_secv(corpus, k);
    _k_secv_set = distinct_k_secv(k_secv_corpus);
 
    save("ouput.mat", "_k_secv_set")
    load("../../input/task3/ref/6_ref_abc_distinct_k_secv.mat")

    if isequal(_k_secv_set, _k_secv_set)
        fprintf(fout, "1");
    else
        fprintf(fout, "0");
    endif
    fclose(fout);
endfunction