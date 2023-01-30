%%
% function: calculate mathcal_N
% INPUT
% * x_vec:      N x 1
% * N:          # of workers
% OUTPUT
% * y_vec:      card(mathcal_N) x 1
%               it is mathcal_N
% * value_min:  the minimum value


function [y_vec, value_min] = fun_set_N(vec_x, N)

buffer_vec = zeros(N-1,1);
for n = 0:N-2
    buffer_vec(n+1) = (n+2) / ([1:n+2] * vec_x(1:n+2));
end
value_min = min(buffer_vec);
y_vec = find(buffer_vec == value_min) - 1;

end