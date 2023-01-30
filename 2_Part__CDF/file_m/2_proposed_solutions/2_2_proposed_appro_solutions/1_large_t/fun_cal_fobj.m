%%
% function: calculate fobj of original problem
% INPUT
% * x_vec:                      N x 1
% * N, L, mu, t_0, M, b, t:     
% OUTPUT
% * num_row:

function f_obj = fun_cal_fobj(x_vec,    N, L, mu, t_0, M, b, t)
%% 
% calculate factor_1
[mathcal_N, value_min] = fun_set_N(x_vec, N);
factor_1 = 0;
for i = 1:size(mathcal_N)
    n = mathcal_N(i);
    factor_1 = factor_1 + nchoosek(N,n+2) * exp(mu * t_0 * (n+2));
end
%% 
% calculate factor_2
factor_2 = exp( - mu*N*t/(M*b) * value_min);
%%
% calculate objective function
f_obj = factor_1 * factor_2;