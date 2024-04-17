function run_test()
    "task-2";
    fout = fopen("out", "w+");
    load("../../input/task2/load1.mat");

    [K] = build_kernel(points, @gaussian_kernel, 1);

    n = size(K, 1);
    
    for i = 1 : n
    	for j = 1 : n
    		fprintf(fout, "%e ", K(i, j));
    	endfor
    	
    	fprintf(fout, "\n");
    endfor
    fclose(fout);
endfunction
