% TSP_CDF Baseline 3 ([Draper])
%%
% clc; 
clear all;
%% System Parameter
% N: # of workers; L: length of gradient
% N = 10; L = 2e4;
% mu = 1e-3; M = 50; b = 1; t = 10^(8.5); t_0 = 300; % 'MbN'= M*b/N
% ================================================
N = 10; L = 4e4; 
mu = 5*10^(-2); M = 50; b = 1; t = 10^(6.8); t_0 = 0; % 'MbN'= M*b/N
% ================================================

num_sample = 1e4;

% N = 10; L = 20000;
% mu = 1e-3; M = 50; b = 1; t = 5e7; t_0 = 1; % 'MbN'= M*b/N
%%
mutN__Mb = mu * t * N / (M * b);
A = exp(-mutN__Mb); B = exp(mu * t_0);
num_Max = 1e5;
%% Baseline 3's design
alpha_we_use = 1;
r = L / alpha_we_use;
cvx_begin
    variables s(r) u
    maximize ( u )
    subject to
        for j = 1:r
            u <= ( s(j) + 1 ) / j;
        end
        sum(s) == N * r - L;
        for j = 1:r-1
            s(j) <= s(j+1);
        end
        s(1) >= 0;
        s(r) <= N-1;    
cvx_end
%% round s
s_continuous = s;
s_integer = round(s_continuous);
%% recover vector_s_L
vector_s_L = [];
for i = 1:r
    vector_s_L = [vector_s_L ; s_integer(i)*ones(N-s_integer(i),1)];    
end
x_baseline_3 = zeros(N,1);
for i=1:N
    x_baseline_3(i) = size( find(vector_s_L == i-1) , 1 );
end
%% Calculate CDF
coefficient_matrix = [];
for i = 1:N
    coefficient_matrix = [coefficient_matrix ; [[1:i],zeros(1,N-i)]];
end
y_baseline_3 = 1 ./ (coefficient_matrix * x_baseline_3);

w_baseline_3 = mutN__Mb * y_baseline_3;
u_baseline_3 = [ log( exp(-w_baseline_3(2:N))-exp(-w_baseline_3(1:N-1)) ) ; log( 1/B-exp(-w_baseline_3(N)) ) ];

% % CDF_basline_3 = fun_large_ln_estimate_CDF_par(u_baseline_3,N,num_Max,B,12);
% % CDF_basline_3 = fun_cal_CDF(u_baseline_3,N,B);
% CDF_basline_3 = fun_cal_CDF_sparse(u_baseline_3,N,B);
% fprintf(2,['CDF_basline_3 = ', num2str(CDF_basline_3), '\n']);

fprintf(2,['--------------------------', [], '\n']);
CDF_est_basline_3 = fun_Est_CDF(t,x_baseline_3,num_sample,  N,mu,t_0,M,b);
fprintf(2,['CDF_est_basline_3 = ', num2str(CDF_est_basline_3), '\n']);
% ================================================v
CDF_est_basline_3_real = fun_Est_CDF_real_samples(t,x_baseline_3,num_sample,  N,M,b);
fprintf(2,['CDF_est_basline_3_real = ', num2str(CDF_est_basline_3_real), '\n']);
% ================================================^

