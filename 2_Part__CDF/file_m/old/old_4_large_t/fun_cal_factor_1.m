%%
% function: calculate factor_1
% INPUT
% * mathcal_N:  colum vector
% * N:          # of workers
% OUTPUT
% * y:          factor_1

function y = fun_cal_factor_1(mathcal_N, N, mu, t_0)

% [mathcal_N, value_min] = fun_set_N(x_vec, N);
factor_1 = 0;
for i = 1:size(mathcal_N)
    n = mathcal_N(i);
    factor_1 = factor_1 + nchoosek(N,n+2) * exp(mu * t_0 * (n+2));
end
y = factor_1;
end