function y = fun_large_ln_estimate_CDF(u,N,num_Max,B)
    vector_sum = 0;
    for i = 1:num_Max
        k = fun_large_sampling_k(N);
%         vector_sum =  vector_sum + ( fun_large_nchooseks(N,k) * prod(exp(u).^k) ) ;
        vector_sum =  vector_sum + exp( log(B^N*2/(N+1)) + fun_large_ln_nchoosek(2*N-1,N-1)...
            + fun_large_ln_nchooseks(N,k) + fun_expindexsum(u,k) );
    end
    vector_sum = vector_sum / num_Max;
    y = vector_sum;
end