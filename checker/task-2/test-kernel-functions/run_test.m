function run_test()
    "task-1";
    fout = fopen("out", "w+");
    load("../../input/task2/random_vectors.mat");

    a = linear_kernel(x, y);
    
    fprintf(fout, "%f\n", a)
    
    a = polynomial_kernel(0.1 * x, y, 2);
    
    fprintf(fout, "%f\n", a)
    
    a = gaussian_kernel(0.079 * x, 0.075 * x + y, 10);
    
    fprintf(fout, "%f\n", a)

    fclose(fout);
endfunction
