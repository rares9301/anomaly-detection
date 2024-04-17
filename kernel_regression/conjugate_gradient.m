function [x] = conjugate_gradient(A, b, x0, tol, max_iter)
    r = b - A * x0;
    v = r;
    x = x0;
    rsold = r' * r;

    for i = 1:max_iter
        Ap = A * v;
        alpha = rsold / (v' * Ap);
        x = x + alpha * v;
        r = r - alpha * Ap;
        rsnew = r' * r;

        if sqrt(rsnew) < tol
            break;
        end

        v = r + (rsnew / rsold) * v;
        rsold = rsnew;
    end

    return x;
end
