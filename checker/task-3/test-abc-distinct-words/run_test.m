
function run_test()    
    fout = fopen("out", "w+");

    k = 2;
    corpus = split_input("../../input/task3/data/x_abc.txt");
    _word_set = distinct_words(corpus);

    save("output.mat", "_word_set")
    
    load("../../input/task3/ref/3_ref_abc_distinct_words.mat")
    if isequal(word_set, _word_set)
        fprintf(fout, "1");
    else
        fprintf(fout, "0");
    endif
    fclose(fout);
endfunction