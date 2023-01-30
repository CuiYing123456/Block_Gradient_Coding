function y = fun_large_ln_estimate_CDF_par(u,N,num_Max,B,num_processor)
%     vector_sum = 0;
%     for i = 1:num_Max
%         k = fun_large_sampling_k(N);
% %         vector_sum =  vector_sum + ( fun_large_nchooseks(N,k) * prod(exp(u).^k) ) ;
%         vector_sum =  vector_sum + exp( log(B^N*2/(N+1)) + fun_large_ln_nchoosek(2*N-1,N-1)...
%             + fun_large_ln_nchooseks(N,k) + fun_expindexsum(u,k) );
%     end
%     vector_sum = vector_sum / num_Max;
%     y = vector_sum;
%     
%     num_processor = 10;
    sample_in_each_processor = num_Max / num_processor;
    sum_array = zeros(num_processor,1);  
    parfor j = 1:num_processor
        for i = sample_in_each_processor*(j-1)+1 : sample_in_each_processor*j
            k = fun_large_sampling_k(N);
            sum_array(j) =  sum_array(j) + exp( log(B^N*2/(N+1)) + fun_large_ln_nchoosek(2*N-1,N-1)...
                          + fun_large_ln_nchooseks(N,k) + fun_expindexsum(u,k) );
        end
    end
    y = sum(sum_array) / num_Max;
    
end