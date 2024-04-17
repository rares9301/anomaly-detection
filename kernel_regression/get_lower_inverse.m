function P = get_lower_inverse(L)
    n = size(L, 1);
    P = eye(n);
    for j = 1:n
        P(j, j) = 1 / L(j, j);
        for i = j+1:n
            P(i, j) = -L(i, j:i-1) * P(j:i-1, j) / L(i, i);
        end
    end
end
