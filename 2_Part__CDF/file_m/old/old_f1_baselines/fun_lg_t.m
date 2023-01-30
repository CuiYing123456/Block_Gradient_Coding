function y = fun_lg_t(N, t, L, mu, t_0, M, b, num_sample)

T_mat = exprnd(1/mu,[num_sample,N]) + t_0;
T_mat_sort = sort(T_mat,2,'ascend');

CDF = zeros(N-1,1);
s = 0;
overall_time = M*b*L/N * T_mat_sort(:,N); 
CDF_opt = length(find(overall_time <= t)) / num_sample;
y = CDF_opt;

end