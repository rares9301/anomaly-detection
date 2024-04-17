
function run_test()    
    fout = fopen("out", "w+");
    k = 3;
    corpus = split_input("../../input/task3/data/x_abc.txt");  
    _k_secv_corpus = k_secv(corpus, k);
    load("../../input/task3/ref/5_ref_abc_k_secv_3.mat")
    save("ouput.mat", "_k_secv_corpus")
    
    if isequal(_k_secv_corpus, k_secv_corpus)
        fprintf(fout, "1");
    else
        fprintf(fout, "0");
    endif
    fclose(fout);
endfunction