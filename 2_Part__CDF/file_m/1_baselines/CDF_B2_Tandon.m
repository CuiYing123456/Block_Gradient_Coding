% TSP_CDF Baseline 2 ([Tandon]-partial straggler)
%%
% clc; 
clear all;
%% System Parameter
% N: # of workers; L: length of gradient
% N = 50; L = 2e4;
% mu = 10^(-3); M = 50; b = 1; t = 10^(8); t_0 = 130; % 'MbN'= M*b/N
% ================================================
N = 10; L = 4e4; 
mu = 5*10^(-2); M = 50; b = 1; t = 10^(6.8); t_0 = 0; % 'MbN'= M*b/N
num_sample = 1e4;
% ================================================

MbL__N = M * b * L / N;

mutN__Mb = mu * t * N / (M * b);
I = eye(N); %for extracting unit vector e_i
A = exp(-mutN__Mb); B = exp(mu * t_0);
%% Baseline 2's design
alpha_Tandon = 6;
CDF_vector = zeros(1,N);
for s_Tandon = 0:N-1
    sum_scalar = 0;
    for i = N-s_Tandon:N
        sum_scalar = sum_scalar + nchoosek(N,i) ...
        * fun_B2_CDF_exp( t / ( MbL__N*(s_Tandon+1)/(s_Tandon+alpha_Tandon)*alpha_Tandon ) , mu , t_0 )^i ...
        * ( fun_B2_CDF_exp( t / ( MbL__N*(s_Tandon+1)/(s_Tandon+alpha_Tandon) ) , mu , t_0 ) ...
            - fun_B2_CDF_exp( t / ( MbL__N*(s_Tandon+1)/(s_Tandon+alpha_Tandon)*alpha_Tandon ) , mu , t_0 ) )^(N-i);
    end
    CDF_vector(s_Tandon+1) = sum_scalar;
end
[CDF_basline_2 , index_s] = max(CDF_vector);
fprintf(2,['CDF_basline_2 = ', num2str(CDF_basline_2), '\n']);
fprintf(2,['index_s = ', num2str(index_s), '\n']);

%% calculate CDF under real samples
s = index_s - 1;
T_mat = fun_real_samples(N, num_sample, L);
T_mat_sort = sort(T_mat,2,'ascend');
buf_mat = [alpha_Tandon * T_mat_sort(:,N-s) , T_mat_sort(:,N)];
[max_value_vec,~] = max(buf_mat,[],2);
buf_vec = MbL__N * (s+1) / (s+alpha_Tandon) * max_value_vec;
CDF_baseline2_real = sum(buf_vec <= t) / num_sample;
fprintf(2,['CDF_basline_2_real = ', num2str(CDF_baseline2_real), '\n']);
