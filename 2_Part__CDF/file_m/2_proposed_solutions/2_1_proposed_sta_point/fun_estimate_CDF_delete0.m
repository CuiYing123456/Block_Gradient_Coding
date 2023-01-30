%  not completed
function y = fun_estimate_CDF_delete0(u,N,num_nonzero_Max,B)
    indicator_vector = find(u ~= -inf);
    count = 0;
    vector_sum = 0;
    while count == num_nonzero_Max
        k = fun_sampling_k(N);
        if find(k ~= 0) == indicator_vector
            count = count + 1;
            vector_sum = vector_sum + fun_nchooseks(N,k) * prod(exp(u).^k);
        end
    end
    vector_sum = vector_sum / num_nonzero_Max;
    
    



end