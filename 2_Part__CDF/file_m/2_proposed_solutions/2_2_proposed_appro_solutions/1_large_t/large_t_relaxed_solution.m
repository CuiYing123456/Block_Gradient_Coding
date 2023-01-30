clc; clear all;
%%
% N = 10; L = 1e4;
% ================================================
N = 10; L = 4e4; 
mu = 5*10^(-2); M = 50; b = 1; t = 10^(6.8); t_0 = 0; num_sample = 1e5;
% ================================================
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

% ===============================
%% Estimate CDF
CDF_est_proposed_large = fun_Est_CDF(t,x,num_sample,  N,mu,t_0,M,b);
fprintf(2,['CDF_est_proposed_large = ', num2str(CDF_est_proposed_large), '\n']);
CDF_est_proposed_large_real = fun_Est_CDF_real_samples(t,x,num_sample,  N,M,b);
fprintf(2,['CDF_est_proposed_large_real = ', num2str(CDF_est_proposed_large_real), '\n']);

