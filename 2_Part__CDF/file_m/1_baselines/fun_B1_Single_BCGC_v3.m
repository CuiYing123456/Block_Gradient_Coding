function [CDF_opt, s_opt] = fun_B1_Single_BCGC_v3(t, L, T_mat, M, N, b)

num_sample = size(T_mat,1);
T_mat_sort = sort(T_mat,2,'ascend');

CDF = zeros(N,1);
for s = 0:N-1
    overall_time = M*b*L/N * (s+1) * T_mat_sort(:,N-s);
    CDF(s+1) = length(find(overall_time <= t)) / num_sample;
end
[CDF_opt, s_opt] = max(CDF);
s_opt = s_opt - 1;

end


