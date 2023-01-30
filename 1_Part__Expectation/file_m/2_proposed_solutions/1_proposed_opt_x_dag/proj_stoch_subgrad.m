%% Jornal -- Add uncoded coordinates
clear; clc; tic;
%% System Parameters
% N: # of workers; R: length of gradient ; mu: exp distribution parameter
% M: # of samples used in each iteration
% N = 30; L = 5e4; mu = 10^(-3); t_0 = 100;
% M = 1e4; iter_Max = 500;
% a = 100;
% ========================
% N = 20; L = 2e4; mu = 10^(-3); t_0 = 50;
% M = 1e4; iter_Max = 150;
N = 50; L = 5750; mu = 5*10^(-2); t_0 = 0;
M = 1e4; iter_Max = 150;
%% Generate Samples (sorted)
% DESCRIPTIVE TEXT
% Sample_matrix = fun_generate_samples(n , mu , M);
%% Initial Point
% x_init = L / N * ones(N,1);
% x_init = [L-(N-1);ones(N-1,1)];
x_init = [ones(N-1,1);L-(N-1)];
% x_init = [1000;100;(L-1100)/(N-2)*ones(N-2,1)];
% load('x_init.mat');
% x_init = x_Jensen_int;

% r_single_value_matrix = R * eye(n-1);
% r_init = r_single_value_matrix(n-1,:);
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
x_init = x_Jensen;
%% start - Stochastic Projected Subgradient
% DESCRIPTIVE TEXT
x_old = zeros(N,1); 
x_new = x_init;  
obj_old_scalar = 0;
obj_new_scalar = 1;
iter = 1;
para = 0.5;
% para = 0.8;
% para = 1;
% alpha_iter = 1 / (iter^para); % step size
alpha_iter = 1; % step size
% while norm(r_new - r_old , 2) > 1e-3
obj_memory = [];
% while norm(obj_new_scalar - obj_old_scalar , 2) > 1e-3
while iter <= iter_Max
    fprintf(2,['iteration = ', num2str(iter), '\n']);
    fprintf(2,['difference = ', num2str(obj_new_scalar - obj_old_scalar,3), '\n']);    
    x_old = x_new;
    obj_old_scalar = obj_new_scalar;
    Sample_matrix_iter = fun_generate_samples(N , mu , M , t_0); % each row of "Sample_matrix_iter" is a sample of vector T_{(.)}
    buffer_matrix = fun_fobj_stoch(x_old,Sample_matrix_iter);
    [~,index_vector] = max(buffer_matrix,[],2);
    sum_vector = 0;
    for i = 1:M
        j = index_vector(i);
        sum_vector = sum_vector + Sample_matrix_iter(i,j)*[1:j,zeros(1,N-j)]';
    end
    sum_vector = sum_vector / M;
    noisy_unbiased_subgrad = sum_vector;
    x_0 = x_old - alpha_iter * noisy_unbiased_subgrad;

    % CVX - projected subgradient 
    cvx_begin
    variables x(N)
    minimize ( norm(x-x_0,2) )
    subject to
        sum(x) == L;
        x >= 0;
    cvx_end
    x_new = x;
%     buffer_matrix_new = fun_fobj_stoch(x_new,Sample_matrix_iter);
%     [obj_new_vector,~] = max(buffer_matrix_new,[],2);
%     obj_new_scalar = sum(obj_new_vector) / M;
    obj_new_scalar = fun_calculate_Etau(x_new,Sample_matrix_iter);
    obj_memory = [obj_memory,obj_new_scalar];
    fprintf(2,['obj_new_scalar = ', num2str(obj_new_scalar,3), '\n']);
    
    iter = iter + 1;
    alpha_iter = 1 / iter; % step size
end
toc;
%% Final Solution
% DESCRIPTIVE TEXT
final_x = x_new;
%% Plot Convergence Curve
% DESCRIPTIVE TEXT
y_for_plot = obj_memory;
x_for_plot = 1:1:length(y_for_plot);
plot(x_for_plot,y_for_plot);
% axis([1,iter_Max,0,max(y_for_plot)]);
xlabel('iteration');
ylabel('approximate fobj');
title([' N = ' , num2str(N) , ', M = ', num2str(M) , ', iter\_Max = ' , num2str(iter_Max), ', L = ', num2str(L) , ', \mu = ', num2str(mu)]);
    
%% Rounding   
Diag_matrix = eye(N);
x_int = floor(final_x);
x_buffer = x_int;
compare_vector = zeros(N,1);
while sum(x_buffer) < L
    for i = 1:N
        compare_vector(i) = fun_calculate_Etau(x_buffer + Diag_matrix(:,i),Sample_matrix_iter) - fun_calculate_Etau(x_buffer,Sample_matrix_iter);
    end
    [~,index_compare] = min(compare_vector);
    x_buffer = x_buffer + Diag_matrix(:,index_compare);
end
x_get = x_buffer;

obj_get = fun_calculate_Etau(x_get,Sample_matrix_iter);
fprintf(2,['obj_get = ', num2str(obj_get,3), '\n'])
% =====================================================v
Sample_matrix_real = fun_generate_real_samples(N, M, L);
obj_get_real = fun_calculate_Etau(x_get,Sample_matrix_real);
fprintf(2,['obj_get_real = ', num2str(obj_get_real,3), '\n'])
% =====================================================^
% %% explanation of optimal solution
% load_each_block = flipud(x_get.*[1:N]');
% stem([1:N]',load_each_block,'red');
% title(['$N$ = ' , num2str(N) , ', ' , '$L$ = ' , num2str(L)] , 'Interpreter' , 'latex');

% Finish Music
% load handel
% sound(y,Fs)

stem([1:N]',x_get,'red');
