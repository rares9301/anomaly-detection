function run_test()
    "task-2";
    fout = fopen("out", "w+");
    load("../../input/task2/load2.mat");

	[X_train, y_train, X_pred, y_pred] = split_dataset(points, z, 0.10);
    [K] = build_kernel(X_train, @polynomial_kernel, 3);

	
    n = size(K, 1);
    
    for i = 1 : n
    	for j = 1 : n
    		fprintf(fout, "%e ", K(i, j));
    	endfor
    	
    	fprintf(fout, "\n");
    endfor
    fclose(fout);
endfunction
