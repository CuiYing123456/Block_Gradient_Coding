%% new solution
% x_0 : x_0 + 2x_1 : ... : x_0 + 2x_1 + ... + Nx_{N-1} = E[1/T]之比
%% 
clear;
%% System Parameters
% N: # of workers; L: length of gradient ; mu: exp distribution parameter
% M: # of samples used in each iteration
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% N = 10; L = 2e4; mu = 10^(-3); t_0 = 50;
% M = 1e4; iter_Max = 500;
% global N L mu t_0 M iter_Max;
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% N = 20; L = 2e4; mu = 10^(-3); t_0 = 50;
% M = 1e4; iter_Max = 150;
N = 50; L = 5750; mu = 5*10^(-2); t_0 = 0;
M = 1e4; iter_Max = 150;
%% Calculate E[T_(n)]
E_T_orderstatistics = zeros(N,1);
for n = 1:N
    E_T_orderstatistics(n) = ( harmonic(N) - harmonic(N-n) ) / mu + t_0;
end
%% Calculate solution_Jensen
x_Jensen = zeros(N,1);
x_Jensen(1) = L / E_T_orderstatistics(N) / sum( 1./( [[1:N-1].*[2:N],N].*flip(E_T_orderstatistics') ) );
for n = 1:N-1
    x_Jensen(n+1) = E_T_orderstatistics(N) / (n+1) * (-1/E_T_orderstatistics(N+1-n) + 1/E_T_orderstatistics(N-n)) * x_Jensen(1);
end
%% calculate f_obj (i.e., Expectation)
Sample_matrix = fun_generate_samples(N , mu , M , t_0);
tau_Jensen = fun_calculate_Etau(x_Jensen,Sample_matrix);
fprintf(2,['tau_Jensen = ', num2str(tau_Jensen,3), '\n']);

x_Jensen_int = round(x_Jensen);
% stem([1:N]',x_Jensen,'red');
% =====================================================v
Sample_matrix_real = fun_generate_real_samples(N, M, L);
tau_Jensen_real = fun_calculate_Etau(x_Jensen,Sample_matrix_real);
fprintf(2,['tau_Jensen_real = ', num2str(tau_Jensen_real,3), '\n']);
% =====================================================^

