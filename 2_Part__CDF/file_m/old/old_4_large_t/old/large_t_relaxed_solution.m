clc; clear all;
%%
N = 10; L = 1e4;
%% CVX
cvx_begin
cvx_solver mosek
variables x(N) u
minimize u
subject to
    sum(x) == L;
    x >= 0;
    for n = 1:N-1
        ( [1:n+1] * x(1:n+1) ) / (n+1) <= u;
    end
cvx_end

