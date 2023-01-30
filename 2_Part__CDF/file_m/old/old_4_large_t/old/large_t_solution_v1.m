clear;
%%
% system parameter
N = 10; L = 2e4;
mu = 1e-3; t_0 = 1; M = 50; b = 1; 
t = 10 .^ [7];
%%
% init
% x = [L;zeros(N-1,1)];
% x = L/N * ones(N,1);
x = [zeros(N-1,1);L];
% x = [L-10*(N-1); 10 * ones(N-1,1)];
%% 
% calculate factor_1
[mathcal_N, value_min] = fun_set_N(x, N);
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
fprintf(2,['----------------------------------------------------------------\n']);
fprintf(2,['x = [', num2str(x'), ']\n']);
fprintf(2,['f_obj = ', num2str(f_obj), '\n']);
fprintf(2,['--------------------------------\n']);
fprintf(2,['N(x) = ', num2str(mathcal_N), '\n']);
fprintf(2,['factor_1 = ', num2str(factor_1), '\n']);
fprintf(2,['factor_2 = ', num2str(factor_2), '\n']);