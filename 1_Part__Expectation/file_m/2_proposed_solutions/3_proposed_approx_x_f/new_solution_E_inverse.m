%% new solution
% x_0 : x_0 + 2x_1 : ... : x_0 + 2x_1 + ... + Nx_{N-1} = E[1/T]Ö®±È
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
%% calculate \eta
eta = zeros(N,1);
sum_buffer_vec = zeros(N,1);
for n = 1:N
%     sum_buffer = 0;
%     for i=0:N-n
%         fun_f(n+i,mu,t_0)
%         sum_buffer = sum_buffer + (-1)^i * nchoosek(N-n,i) * fun_f(n+i,mu,t_0);
%     end    
    sum_buffer = fun_int(n,N-n+1,mu,t_0);
    sum_buffer_vec(n) = sum_buffer;
    eta(n) = (-mu) * n * nchoosek(N,n) * sum_buffer;
end
%% generate the new solution
x_solution = zeros(N,1);
m_hat = L / sum( eta' ./ [[1:N-1].*[2:N],N] );
for n = 1:N
    if n == 1
        x_solution(n) = eta(1) * m_hat;
    else
        x_solution(n) = ( eta(n) - eta(n-1) ) / n * m_hat;
    end
end
%% calculate f_obj (i.e., Expectation)
Sample_matrix = fun_generate_samples(N , mu , M , t_0);
new_solution_tau = fun_calculate_Etau(x_solution,Sample_matrix);
fprintf(2,['tau_E_inverse = ', num2str(new_solution_tau,3), '\n']);
% =====================================================v
Sample_matrix_real = fun_generate_real_samples(N, M, L);
new_solution_tau_real = fun_calculate_Etau(x_solution,Sample_matrix_real);
fprintf(2,['tau_E_inverse_real = ', num2str(new_solution_tau_real,3), '\n'])
% =====================================================^


% one_divide_Sample_matrix = 1 ./ Sample_matrix;
% sum(one_divide_Sample_matrix,1) / M;

% % % % %% order optimality test
% % % % clc;clear;
% % % % N = 500; L = 2e4; mu = 10^(-3); t_0 = 1;
% % % % M = 1e4; iter_Max = 500;
% % % % 
% % % % Sample_matrix = fun_generate_samples(N , mu , M , t_0);
% % % % T_maxtrx = fliplr(Sample_matrix);
% % % % E_T_vector = sum(T_maxtrx) / M;
% % % % one__T_matrix = 1 ./ T_maxtrx;
% % % % E_one__T_vector = sum(one__T_matrix) / M;
% % % % sum(E_T_vector .* E_one__T_vector)

% fprintf(2,['new_solution_tau/N = ', num2str(new_solution_tau/N,3), '\n']);

% stem([1:N]',x_get,'red');







