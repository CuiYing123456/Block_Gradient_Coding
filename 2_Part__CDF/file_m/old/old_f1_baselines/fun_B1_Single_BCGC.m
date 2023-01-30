function y = fun_B1_Single_BCGC(N, t, L, mu, t_0, M, b, num_sample)
I = eye(N); %for extracting unit vector e_i
mutN__Mb = mu * t * N / (M * b);
A = exp(-mutN__Mb); B = exp(mu * t_0);
% num_sample = 1e4;
% num_Max = 1e4;
%% Baseline 1's design
coefficient_matrix = [];
for i = 1:N
    coefficient_matrix = [coefficient_matrix ; [[1:i],zeros(1,N-i)]];
end
CDF_Max = 0; CDF_new = 0; i_flag = 0;
for i = 1:N
    x_baseline_1 = I(:,i)*L;

    y_baseline_1 = 1 / (coefficient_matrix * x_baseline_1);

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
CDF_est_basline_1 = fun_Est_CDF(t,I(:,i_flag)*L,num_sample,  N,mu,t_0,M,b);
y = CDF_est_basline_1;
end