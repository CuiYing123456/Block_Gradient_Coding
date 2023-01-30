%%
% function: calculate a convex problem, return solution x
% INPUT
% * mathcal_N:  set_N(x), colume vector
% * N:          # of workers
% * L:
% OUTPUT
% * x_vec:      N x 1
%               solution

function x_vec = fun_solve_convex(mathcal_N, N, L)

n_0 = mathcal_N(1);
buffer_vec = setdiff([0:N-2]', mathcal_N);
cvx_begin
cvx_solver mosek
variables x(N)
minimize( [1:n_0+2] * x(1:n_0+2) )
subject to
    sum(x) == L;
    x >= 0;
    for i = 1:size(buffer_vec)
        [1:n_0+2] * x(1:n_0+2) / (n_0+2) > [1:buffer_vec(i)+2] * x(1:buffer_vec(i)+2) / (buffer_vec(i)+2);
    end
    for i = 1:size(mathcal_N)
        [1:n_0+2] * x(1:n_0+2) / (n_0+2) == [1:mathcal_N(i)+2] * x(1:mathcal_N(i)+2) / (mathcal_N(i)+2);
    end 
cvx_end
x_vec = x;

end