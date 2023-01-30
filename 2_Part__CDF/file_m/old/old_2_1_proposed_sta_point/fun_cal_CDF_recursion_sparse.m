function y = fun_cal_CDF_recursion_sparse(u,N,B,vector_given,indicator_vec)
    sum_result = 0;
    length_1 = length(vector_given);
    if length_1 < N-1 
        sum_1 = sum(vector_given);
% ----------------------------------------------------------------------------------------------
        for k = 0 : min([length_1 + 1 - sum_1 , (1-indicator_vec(length_1 + 1))*10000])
            sum_result = sum_result + fun_cal_CDF_recursion_sparse(u,N,B,[vector_given;k],indicator_vec);
        end
% ----------------------------------------------------------------------------------------------
%         result = zeros(min([length_1 + 1 - sum_1 , (1-indicator_vec(length_1 + 1))*10000]) + 1,1);
%         parfor k = 0 : min([length_1 + 1 - sum_1 , (1-indicator_vec(length_1 + 1))*10000])
%             result(k+1) = fun_cal_CDF_recursion(u,N,B,[vector_given;k]);
%         end
%         sum_result = sum(result);
% ----------------------------------------------------------------------------------------------
    else
        sum_1 = sum(vector_given);
        vector_k = [vector_given;N-sum_1];
        sum_result =  sum_result + exp( fun_large_ln_nchooseks(N,vector_k) + fun_expindexsum(u,vector_k) );
    end
    y = sum_result;
end