function run_test()
    "task-2";
    fout = fopen("out", "w+");
    load("../../input/task2/cholesky_like.mat");

    [L1] = cholesky(A);

    n1 = size(L1, 1);
    
    for i = 1 : n1
    	for j = 1 : n1
    		fprintf(fout, "%e ", L1(i, j));
    	endfor
    	
    	fprintf(fout, "\n");
    endfor
    
    [L1] = cholesky(B);

    n1 = size(L1, 1);
    
    for i = 1 : n1
    	for j = 1 : n1
    		fprintf(fout, "%e ", L1(i, j));
    	endfor
    	
    	fprintf(fout, "\n");
    endfor
    
    [L1] = cholesky(C);

    n1 = size(L1, 1);
    
    for i = 1 : n1
    	for j = 1 : n1
    		fprintf(fout, "%e ", L1(i, j));
    	endfor
    	
    	fprintf(fout, "\n");
    endfor
    fclose(fout);
endfunction
