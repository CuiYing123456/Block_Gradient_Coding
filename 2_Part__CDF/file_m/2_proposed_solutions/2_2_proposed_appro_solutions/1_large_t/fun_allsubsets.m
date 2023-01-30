%%
% function: calculate all subsets of {0,1,...,N} except void
% INPUT
% * x_vec:      N x 1
% * N:          # of workers
% OUTPUT
% * y_cell:     1 x (N+1)


function y_cell = fun_allsubsets(N)

A = 0:N;
y_cell = arrayfun(@(k) nchoosek(A, k), 1:N+1, 'un', 0);
% y_cell{:};

end