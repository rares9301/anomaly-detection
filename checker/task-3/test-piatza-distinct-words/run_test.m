
function run_test()   

    fout = fopen("out", "w+"); 
    corpus = split_input("../../input/task3/data/x_piatza.txt");
    _word_set = distinct_words(corpus);
    load("../../input/task3/ref/2_ref_piatza_distinct_words.mat")
    save("output.mat", "_word_set")
    
    if isequal(_word_set, word_set)
        fprintf(fout, "1");
    else
        fprintf(fout, "0");
    endif
    fclose(fout);
endfunction