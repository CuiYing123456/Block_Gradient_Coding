% x_0 + x_1 + ... + x_{N-1} = L

function [x_get_smallt, mat_x, CDF, max_value, max_index] = exhaustive_small_t(N,L, t,num_sample,mu,t_0,M,b)
mat_x = fun_generate_mat_x(N,L);
CDF = zeros(size(mat_x,1),1);
parfor row = 1:size(mat_x,1)
    CDF(row) = fun_Est_CDF(t,mat_x(row,:)',num_sample,  N,mu,t_0,M,b);
end

[max_value, max_index] = max(CDF);
x_get_smallt = mat_x(max_index,:)';