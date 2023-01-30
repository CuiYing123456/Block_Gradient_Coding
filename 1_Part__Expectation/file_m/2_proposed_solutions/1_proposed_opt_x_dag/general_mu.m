%% General mu --> closed-form solution
clear; clc; tic;
%% System Parameters
% N: # of workers; R: length of gradient ; mu: exp distribution parameter
% M: # of samples used in each iteration
% N = 30; L = 5e4; mu = 10^(-3); t_0 = 100;
% M = 1e4; iter_Max = 500;
% a = 100;
% ========================
N = 30; L = 2e4; mu = 10^(-3); t_0 = 0;
M = 1e4; iter_Max = 150;
%% Calculate vector_alpha
vector_alpha = zeros(N,1);
for n = 1:N
    vector_alpha(n) = 1/mu * sum( 1./[N:-1:n] ) + t_0;
end
%% Calculate the closed-form solution x
x_general_mu = zeros(N,1);
% Calculate x_0
x_general_mu(1) = L / vector_alpha(1) / sum( 1 ./ ( [ [1:N-1] .* [2:N] , N ] .* vector_alpha' ) );
for n = 2:N
    x_general_mu(n) = vector_alpha(1) / n * (-1/vector_alpha(n-1) + 1/vector_alpha(n)) * x_general_mu(1);
end
%%
display('finished');
Sample_matrix_iter = fun_generate_samples(N , mu , M , t_0); % each row of "Sample_matrix_iter" is a sample of vector T_{(.)}

%% Rounding   
Diag_matrix = eye(N);
x_int = floor(x_general_mu);
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


