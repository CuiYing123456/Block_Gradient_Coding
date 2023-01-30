%% proposed approx. solution at large t
clc; clear;
L = 2e4; mu = 1e-3;   num_sample = 1e4; N=20; t_0 = 1; M = 50; b = 1; 
t_table = 10 .^ [7.00:0.25:9.00];
x_large = [L;zeros(N-1,1)];
%% CDF_vs_N
CDF_est_large_t = zeros(9,1); % aim to plot 9 points
for i = 1:9
    t = t_table(i);
%     x_large = [L;zeros(N-1,1)];
    CDF_est_large_t(i) = fun_Est_CDF(t,x_large,num_sample, N,mu,t_0,M,b);
end
% %% CDF_vs_N
% CDF_est_large_t = zeros(N,1);
% for i = 1:5
%     N = i * 10;
%     CDF_est_large_t(i) = fun_Est_CDF(t,x_large,num_sample, N,mu,t_0,M,b);
% end