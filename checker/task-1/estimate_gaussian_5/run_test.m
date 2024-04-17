
function run_test()
    "task-1";
    fout = fopen("out", "w+");
    load("../../input/task1/test_5.mat");
    load("../../input/task1/ref_5.mat");
    [_mean_values _variances] = estimate_gaussian(X)
    if __equal(_mean_values, mean_values) == 1 && __equal(_variances, variances) == 1
        fprintf(fout, "%d", 1);
    else 
        fprintf(fout, "%d", 0);
    endif 
    fclose(fout);
endfunction