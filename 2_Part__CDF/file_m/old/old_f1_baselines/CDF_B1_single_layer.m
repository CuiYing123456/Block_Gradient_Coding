% TSP_CDF Baseline 1 (Single BCGC)
%%
% clc; 
clear all;
%% System Parameter
% N: # of workers; L: length of gradient
N = 50; L = 2e4;
mu = 1e-3; M = 50; b = 1; t = 10^(8.5); t_0 = 1; % 'MbN'= M*b/N

I = eye(N); %for extracting unit vector e_i
mutN__Mb = mu * t * N / (M * b);
A = exp(-mutN__Mb); B = exp(mu * t_0);
num_sample = 1e4;
% num_Max = 1e4;
%% Baseline 1's design
coefficient_matrix = [];
for i = 1:N
    coefficient_matrix = [coefficient_matrix ; [[1:i],zeros(1,N-i)]];
end
CDF_Max = 0; CDF_new = 0; i_flag = 0;
for i = 1:N
    x_baseline_1 = I(:,i)*L;

    y_baseline_1 = 1 ./ (coefficient_matrix * x_baseline_1);

    w_baseline_1 = mutN__Mb * y_baseline_1;

    u_baseline_1 = [log(exp(-w_baseline_1(2:N))-exp(-w_baseline_1(1:N-1)) )...
        ; log( 1/B-exp(-w_baseline_1(N)))];
    %% calculate CDF_B1
%     CDF_new = fun_large_ln_estimate_CDF_par(u_baseline_1,N,num_Max,B,12);
    CDF_new = fun_cal_CDF_sparse(u_baseline_1,N,B);
    if CDF_new > CDF_Max
        i_flag = i;
        CDF_Max = CDF_new;
    end
end
% fprintf(2,['CDF_basline_1 = ', num2str(CDF_Max), '\n']);
% fprintf(2,['i_flag = ', num2str(i_flag), '\n']); % only x_{i_flag} = L

fprintf(2,['--------------------------', [], '\n']);
CDF_est_basline_1 = fun_Est_CDF(t,I(:,i_flag)*L,num_sample,  N,mu,t_0,M,b);
fprintf(2,['CDF_est_basline_1 = ', num2str(CDF_est_basline_1), '\n']);

