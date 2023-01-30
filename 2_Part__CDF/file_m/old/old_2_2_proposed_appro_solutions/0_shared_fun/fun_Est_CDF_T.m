%%
% function: estimate CDF by sampling T_1, ... , T_N
% INPUT
% * t:     time threshold
% * x_vec: solution, N x 1
% * T_mat: vector(workers' CPU cycle time), num_sample x N
% * M,N,b: system para.
% OUTPUT
% y: estimated CDF

function y = fun_Est_CDF_T(t,x_vec,T_mat,M,N,b)

num_sample = size(T_mat,1);
buf_mat = zeros(num_sample,N);
T_mat_sort = sort(T_mat,2,'ascend');
for n = 0:N-1
    buf_mat(:,n+1) = M / N * b * T_mat_sort(:,N-n) * sum([1:n+1]' .* x_vec(1:n+1));
end
buf_vec = max(buf_mat,[],2);
y = sum(buf_vec <= t) / num_sample;

end
