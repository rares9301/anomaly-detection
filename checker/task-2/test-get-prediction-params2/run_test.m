function run_test()
    "task-2";
    fout = fopen("out", "w+");
    load("../../input/task2/load3.mat");
    
    

    [X_train, y_train, X_pred, y_pred] = split_dataset(points, z, 0.65);
    
    [K] = build_kernel(X_train, @polynomial_kernel, 2);
    
    
    [a] = get_prediction_params(K, y_train, 1);
    
    
    n = size(a, 1);
    
    for i = 1 : n
    	fprintf(fout, "%e\n", a(i));
    endfor
    fclose(fout);
endfunction
