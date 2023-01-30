%% Baseline 3 -- [Tandon]
% idea --> calculate \alpha in [Tandon]; 
%%
clear; 
%% System Parameters
% N: # of workers; L: length of gradient ; mu: exp distribution parameter
% M: # of samples used in each iteration
% n = 50; M = 1e4; iter_Max = 100;
% R = 1e3; mu = 2; 
% a = 100;
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% N = 50; L = 2e4; mu = 10^(-3); t_0 = 20;
% M = 1e4; 
% iter_Max = 100;
global N L mu t_0 M iter_Max;
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% calculate baseline 3
% DESCRIPTIVE TEXT
alpha_Tandon = ceil( (1-log(0.5))/(1+log(0.5)) );
Sample_matrix = fun_generate_samples_all(N , mu , M , t_0);
% tau_sample_avg = 0;
tau = zeros(1,N-1);
for s = 1:N-1
    buffer_sum_scala = 0;
    for i = 1:M        
        t_1 = Sample_matrix(i,s+1);
        t_2 = Sample_matrix(i,1);
        buffer_tau = (s+1) * L / (s + alpha_Tandon) * max([alpha_Tandon * t_1,t_2]);
        buffer_sum_scala = buffer_sum_scala + buffer_tau;
    end
    tau(s) = buffer_sum_scala / M;
end
[baseline_3_tau , s_opt_index] = min(tau);
s_opt = s_opt_index;
fprintf(2,['baseline_3_tau = ', num2str(baseline_3_tau,3), '\n']);
fprintf(2,['s_opt = ', num2str(s_opt,6), '\n']);
% =====================================================v
I = eye(N);
x_opt = L * I(:,s_opt);
Sample_matrix_real = fun_generate_real_samples(N, M, L);
baseline_3_tau_real = fun_calculate_Etau(x_opt,Sample_matrix_real);
fprintf(2,['baseline_3_tau_real = ', num2str(baseline_3_tau_real,3), '\n'])
% =====================================================^


