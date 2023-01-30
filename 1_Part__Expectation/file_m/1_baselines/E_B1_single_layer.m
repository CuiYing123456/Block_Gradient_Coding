%% Baseline 1 -- proposed scheme (single layer)
% idea --> r_i = R, r_j = 0, j \= i;
%%
clear;
%% System Parameters
% n: # of workers; R: length of gradient ; mu: exp distribution parameter
% M: # of samples used in each iteration
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% N = 10; L = 2e4; mu = 10^(-3); t_0 = 50;
% M = 1e4; iter_Max = 500;
global N L mu t_0 M iter_Max;
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% traverse all n-1 solutions
% generate all n-1 solutions
x_matrix = L * eye(N);
Sample_matrix = fun_generate_samples(N , mu , M , t_0);
obj_scalar = zeros(1,N);
for i = 1:N
    x_solution = x_matrix(i,:)';
%     buffer_matrix = fun_fobj_stoch(r_solution,Sample_matrix);
%     [obj_vector,~] = max(buffer_matrix,[],2);
%     obj_scalar(i) = sum(obj_vector) / M;
    obj_scalar(i) = fun_calculate_Etau(x_solution,Sample_matrix);
end
[baseline_1_tau_opt , x_opt_index] = min(obj_scalar);
x_opt = x_matrix(x_opt_index,:);
fprintf(2,['baseline_1_tau_opt = ', num2str(baseline_1_tau_opt,6), '\n']);
fprintf(2,['x_opt_index = ', num2str(x_opt_index), '\n']);
% =====================================================v
Sample_matrix_real = fun_generate_real_samples(N, M, L);
baseline_1_tau_opt_real = fun_calculate_Etau(x_opt',Sample_matrix_real);
fprintf(2,['baseline_1_tau_opt_real = ', num2str(baseline_1_tau_opt_real,3), '\n'])
% =====================================================^
% % %% Rounding   
% % final_r = r_matrix(r_opt_index,:);
% % 
% % Diag_matrix = eye(n-1);
% % r_int = floor(final_r);
% % r_buffer = r_int;
% % compare_vector = zeros(1,n-1);
% % while sum(r_buffer) < R
% %     for i = 1:n-1
% %         compare_vector(i) = fun_calculate_Etau(r_buffer' + Diag_matrix(i,:),Sample_matrix_iter) - fun_calculate_Etau(r_buffer',Sample_matrix_iter);
% %     end
% %     [~,index_compare] = min(compare_vector);
% %     r_buffer = r_buffer + Diag_matrix(:,i);
% % end
% % r_get = r_buffer;
% % obj_get = fun_calculate_Etau(r_get',Sample_matrix_iter);
% % fprintf(2,['obj_get = ', num2str(obj_get,3), '\n'])