%% given the system design, calculate the CDF
% ...ok
function y = fun_estimate_CDF(u,N,num_Max,B)
    vector_sum = 0;
    for i = 1:num_Max
        k = fun_sampling_k(N);
%         vector_sum = vector_sum + fun_nchooseks(N,k) * exp(k'*u);
        vector_sum = vector_sum + fun_nchooseks(N,k) * prod(exp(u).^k);
    end
    vector_sum = vector_sum / num_Max;
    y = vector_sum * fun_Card(0,N) * (B^N);
end