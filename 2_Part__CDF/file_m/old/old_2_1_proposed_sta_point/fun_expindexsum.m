function y = fun_expindexsum(u,k)
    N = length(u);
    sum_scalar = 0;
    for i = 1:N
        if k(i) == 0 & u(i) == -inf
            buffer = 0;
        else
            buffer = k(i)*u(i);
        end
        sum_scalar = sum_scalar + buffer;
    end
    y = sum_scalar;
end