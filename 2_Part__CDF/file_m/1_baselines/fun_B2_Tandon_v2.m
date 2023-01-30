function [CDF_opt, s_opt] = fun_B2_Tandon_v2(N, t, L, mu, t_0, M, b, num_sample)
alpha = 6;

T_mat = exprnd(1/mu,[num_sample,N]) + t_0;
T_mat_sort = sort(T_mat,2,'ascend');

CDF = zeros(N-1,1);
for s = 1:N-1
    overall_time = M*b*L/N * (s+1)/(s+alpha) ...
        * max([alpha*T_mat_sort(:,N-s),T_mat_sort(:,N)],[],2);
    CDF(s) = length(find(overall_time <= t)) / num_sample;
end
[CDF_opt, s_opt] = max(CDF);
end