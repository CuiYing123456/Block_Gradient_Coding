function y = fun_cal_CDF_recursion(u,N,B,vector_given)
    sum_result = 0;
    length_1 = length(vector_given);
    if length_1 < N-1 
        sum_1 = sum(vector_given);
% ----------------------------------------------------------------------------------------------
        for k = 0 : length_1 + 1 - sum_1
            sum_result = sum_result + fun_cal_CDF_recursion(u,N,B,[vector_given;k]);
        end
% ----------------------------------------------------------------------------------------------
%         result = zeros(length_1 + 1 - sum_1 + 1,1);
%         parfor k = 0 : length_1 + 1 - sum_1
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