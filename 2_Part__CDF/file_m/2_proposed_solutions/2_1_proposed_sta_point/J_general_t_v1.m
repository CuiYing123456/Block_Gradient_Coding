clc; clear all;
% tic;
%% System Parameter
t_axis = 10 .^ [8.20:0.05:8.50]; 

num_points = length(t_axis);
N = 20; L = 2e4; mu = 10^(-3); t_0 = 1; M = 50; b = 1; num_sample = 1e5;
%% solve
L_prop_sta_point = zeros(num_points,1);
T_mat = exprnd(1/mu,[num_sample,N]) + t_0;
for i = 1:num_points
    x_get_int = fun_cal_sta_point(t_axis(i) , L, M, N, b, mu, t_0);
    L_prop_sta_point(i) = fun_Est_CDF_T(t_axis(i), x_get_int, T_mat, M, N, b);
end
% fprintf(2,['CDF_est_proposed = ', num2str(L_prop_sta_point), '\n']);
%%
% toc;