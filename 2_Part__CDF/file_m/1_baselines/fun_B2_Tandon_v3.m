function [CDF_opt, s_opt] = fun_B2_Tandon_v3(t, L, T_mat, M, N, b)
alpha = 6;

num_sample = size(T_mat,1);
T_mat_sort = sort(T_mat,2,'ascend');

CDF = zeros(N-1,1);
for s = 1:N-1
    overall_time = M*b*L/N * (s+1)/(s+alpha) ...
        * max([alpha*T_mat_sort(:,N-s),T_mat_sort(:,N)],[],2);
    CDF(s) = length(find(overall_time <= t)) / num_sample;
end
[CDF_opt, s_opt] = max(CDF);
end