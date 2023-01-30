%% generate M samples (vector_t), where vector_t = (t_(N) , ... , t_(1))
% input: 
%       N
%       mu -> exponential distribution parameter
%       M
% output: 
%       ( M * N matrix) Y; each row is vector_t = (t_(N) , ... , t_(1))
function Y = fun_generate_samples(N , mu , M , t_0)
buffer_matrix = exprnd(1/mu,[M,N]) + t_0;
Y = sort(buffer_matrix,2,'descend');
% Y = Y(:,2:N);
end
