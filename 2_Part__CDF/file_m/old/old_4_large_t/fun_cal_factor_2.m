%%
% function: calculate factor_2
% INPUT
% * x_vec:      N x 1
% * N:          # of workers
% OUTPUT
% * y_vec:      card(mathcal_N) x 1
%               it is mathcal_N
% * value_min:  the minimum value

function y = fun_cal_factor_2(value_min, N, mu, t, M, b)

y = exp( - mu*N*t/(M*b) * value_min);

end