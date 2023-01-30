clc;  clear all;
tic;
%% system setup
N = 7; L = 15; t = 1*10^(4); t_0 = 10; mu = 1e-3;
M = 50; b = 1;
% 'MbN'= M*b/N
num_sample = 1e4;
%%
[x_get_smallt, mat_x, CDF, max_value, max_index] = exhaustive_small_t(N,L, t,num_sample,mu,t_0,M,b);
% fprintf(2,['x_get_smallt = ', num2str(x_get_smallt'), '\n']);
display('done!');
%%
toc;