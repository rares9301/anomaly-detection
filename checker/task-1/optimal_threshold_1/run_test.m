
function run_test()
    "task1";
    fout = fopen("out", "w+");
    load("../../input/task1/test_1.mat");
    load("../../input/task1/ref_1.mat");
    [_epsilon _F1 _precision _recall] = optimal_threshold(yval, probabilities);
    if _epsilon == epsilon && _F1 == F1
        fprintf(fout, "%d", 1);
    else 
        fprintf(fout, "%d", 0);
    endif 
    fclose(fout);
endfunction