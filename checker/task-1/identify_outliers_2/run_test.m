
function run_test()
    "task-1";
    fout = fopen("out", "w+");
    load("../../input/task1/test_2.mat");
    load("../../input/task1/ref_2.mat");
    _outliers = identify_outliers(X, yval)
    if __equal(_outliers, outliers) == 1
        fprintf(fout, "%d", 1);
    else 
        fprintf(fout, "%d", 0);
    endif 
    fclose(fout);
endfunction