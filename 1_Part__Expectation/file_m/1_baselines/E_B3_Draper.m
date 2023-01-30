%% Baseline 4 -- [Draper]
% idea --> solve Draper's optimization problem
%%
% clear all;
% clearvars -except N L mu t_0 M iter_Max;
clear;
%% System Parameters
% n: # of workers; R: length of gradient ; mu: exp distribution parameter
% M: # of samples used in each iteration
% n = 50; M = 1e4; 
% R = 1e3; mu = 2;
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% N = 10; L = 2e4; mu = 10^(-3); t_0 = 50; 
% M = 1e4; 
% alpha_we_use = 2;
% N = 30; L = 5750; mu = 5*10^(-2); t_0 = 139.1;
% M = 1e4; iter_Max = 150;
global N L mu t_0 M iter_Max alpha_we_use;
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% for N = 40:10:50
%% calculate baseline 4's optimization problem
ell = L/alpha_we_use;
% memory_s = zeros(ceil(R/(n-1))-1,R);  
% memory_u = zeros(ceil(R/(n-1))-1,1);  
iter = 1;
% for ell = ceil(R/(n-1)):R
    fprintf(2,['iteration = ', num2str(iter), '\n']);
% ell = n-1;
% applying cvx
cvx_begin
    variables u s(ell)
    maximize ( u )
    subject to
        for j = 1:ell
            u <= ( s(j) + 1 ) / j;
        end
        sum(s) == ell * N - L;
        for j = 1:ell-1
            s(j) <= s(j+1);
        end
        s(1) >= 1;
        s(ell) <= N-1;    
cvx_end
% memory_s = [memory_s ; [s',zeros(1,R-ell)] ];
% memory_u = [memory_u ; u];
% iter = iter + 1;
% end
% find the best s
% [value,index] = max(memory_u);
% s_opt = memory_s(index,:);    
% s_opt_integer = round(s_opt);
%%
s_opt = s;
s_opt_integer = round(s_opt);
%% s --> r
r_baseline_4 = zeros(1,N);
for i=1:N
    r_baseline_4(i) = size( find(s_opt_integer == i-1) , 1 );
end
r_baseline_4 = r_baseline_4 * alpha_we_use;
%% calculate fobj (proposed)
% DESCRIPTIVE TEXT
Sample_matrix = fun_generate_samples(N , mu , M , t_0);
baseline_4_tau = fun_calculate_Etau(r_baseline_4',Sample_matrix);
fprintf(2,['baseline_4_tau = ', num2str(baseline_4_tau,3), '\n']);
% =====================================================v
Sample_matrix_real = fun_generate_real_samples(N, M, L);
baseline_4_tau_real = fun_calculate_Etau(r_baseline_4',Sample_matrix_real);
fprintf(2,['baseline_4_tau_real = ', num2str(baseline_4_tau_real,3), '\n'])
% =====================================================^


% end
% f = msgbox('Operation Completed!', 'Done', 'help');