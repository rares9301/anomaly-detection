function run_test()
    "task-2";
    fout = fopen("out", "w+");
    load("../../input/task2/cholesky_like.mat");

    [L1] = cholesky(A);
	[P1] = get_lower_inverse(L1);
    n1 = size(L1, 1);
    
    for i = 1 : n1
    	for j = 1 : n1
    		fprintf(fout, "%e ", P1(i, j));
    	endfor
    	
    	fprintf(fout, "\n");
    endfor
    
    [L1] = cholesky(B);
	[P1] = get_lower_inverse(L1);
    n1 = size(L1, 1);
    
    for i = 1 : n1
    	for j = 1 : n1
    		fprintf(fout, "%e ", P1(i, j));
    	endfor
    	
    	fprintf(fout, "\n");
    endfor
    
    [L1] = cholesky(C);
	[P1] = get_lower_inverse(L1);
	
    n1 = size(L1, 1);
    
    for i = 1 : n1
    	for j = 1 : n1
    		fprintf(fout, "%e ", P1(i, j));
    	endfor
    	
    	fprintf(fout, "\n");
    endfor
    fclose(fout);
endfunction
