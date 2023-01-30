% idea --> r_i = R, r_j = 0, j \= i;
%%
clear; clc;
%% System Parameters
% n: # of workers; R: length of gradient ; mu: exp distribution parameter
% M: # of samples used in each iteration
% N = 30; L = 2e4; mu = 10^(-3); t_0 = 100;
% M = 1e4;
N = 30; L = 5750; mu = 5*10^(-2); t_0 = 139.1;
M = 1e4; iter_Max = 150;
%% Calculate Objective Value 
Sample_matrix = fun_generate_samples(N , mu , M , t_0);
r_matrix = L * eye(N);
r_solution = r_matrix(N,:);
% buffer_matrix = fun_fobj_stoch(r_solution,Sample_matrix);
% [obj_vector,~] = max(buffer_matrix,[],2);
% obj_scalar = sum(obj_vector) / M;
obj_scalar = fun_calculate_Etau(r_solution',Sample_matrix);
%% Display
fprintf(2,['obj_scalar = ', num2str(obj_scalar,6), '\n']);
% fprintf(2,['r_solution = ', num2str(r_solution), '\n']);


% % %% Rounding   
% % final_r = r_solution';
% % 
% % Diag_matrix = eye(n-1);
% % r_int = floor(final_r);
% % r_buffer = r_int;
% % compare_vector = zeros(1,n-1);
% % while sum(r_buffer) < R
% %     for i = 1:n-1
% %         compare_vector(i) = fun_calculate_Etau(r_buffer' + Diag_matrix(i,:),Sample_matrix) - fun_calculate_Etau(r_buffer',Sample_matrix);
% %     end
% %     [~,index_compare] = min(compare_vector);
% %     r_buffer = r_buffer + Diag_matrix(:,i);
% % end
% % r_get = r_buffer;
% % obj_get = fun_calculate_Etau(r_get',Sample_matrix);
% % fprintf(2,['obj_get = ', num2str(obj_get,3), '\n'])