%% Baseline 2 -- proposed scheme (multi-layer, uniform parameter)
% idea --> r_i = R / (n-1);
%%
clear; clc;
%% System Parameters
% N: # of workers; L: length of gradient ; mu: exp distribution parameter
% M: # of samples used in each iteration
N = 25; L = 2e4; mu = 10^(-3); t = 100;
M = 1e4;
% iter_Max = 100;
% a = 100;
%% generate the solution
% DESCRIPTIVE TEXT
Sample_matrix = fun_generate_samples(N , mu , M , t);
x_solution = L / (N) * ones(N,1);
% buffer_matrix = fun_fobj_stoch(r_solution,Sample_matrix);
% [obj_vector,~] = max(buffer_matrix,[],2);
% obj_scalar = sum(obj_vector) / M;
obj_scalar = fun_calculate_Etau(x_solution,Sample_matrix);
baseline_2_tau = obj_scalar;
fprintf(2,['baseline_2_tau = ', num2str(baseline_2_tau,6), '\n']);

%% Rounding   
final_x = x_solution;

Diag_matrix = eye(N);
x_int = floor(final_x);
x_buffer = x_int;
compare_vector = zeros(1,N);
while sum(x_buffer) < L
    for i = 1:N
        compare_vector(i) = fun_calculate_Etau(x_buffer + Diag_matrix(:,i),Sample_matrix) - fun_calculate_Etau(x_buffer,Sample_matrix);
    end
    [~,index_compare] = min(compare_vector);
    x_buffer = x_buffer + Diag_matrix(:,i);
end
x_get = x_buffer;
obj_get = fun_calculate_Etau(x_get,Sample_matrix);
fprintf(2,['obj_get = ', num2str(obj_get,3), '\n'])
