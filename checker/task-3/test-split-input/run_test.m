
function run_test()    
    fout = fopen("out", "w+");
    _corpus = split_input("../../input/task3/data/x_piatza.txt");
    load("../../input/task3/ref/1_ref_piatza_split_input.mat")
    save("output.mat", "_corpus")
    if isequal(_corpus, corpus)
        fprintf(fout, "1");
    else
        fprintf(fout, "0");
    endif
    fclose(fout);
endfunction