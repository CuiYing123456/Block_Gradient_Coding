function y = fun_large_estimate_CDF(u,N,num_Max,B)
    vector_sum = 0;
    for i = 1:num_Max
        k = fun_large_sampling_k(N);
%         vector_sum = vector_sum + fun_nchooseks(N,k) * exp(k'*u);
%         vector_sum = vector_sum + fun_large_nchooseks(N,k) * prod(exp(u).^k);
        vector_sum =  vector_sum + ( fun_large_nchooseks(N,k) * prod(exp(u).^k) ) * 1e20;
    end
%     vector_sum = vector_sum / num_Max;
    vector_sum = vector_sum / num_Max / 1e20;
    y = vector_sum * fun_large_Card(0,N) * (B^N);


end