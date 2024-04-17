% DO NOT MODIFY THIS FILE!

function res = __equal(A, B)
    epsilon = 1e-2;
    res = 0;
    if(size(A) != size(B))
        return;
    endif
    if(abs(mean(mean(A-B)))<epsilon)
        res = 1;
    endif
endfunction