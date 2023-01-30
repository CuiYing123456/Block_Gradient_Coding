%%
% function: estimate CDF by sampling T_1, ... , T_N
% * t:            time threshold
% * x_vec:        solution, N x 1
% * num_sample:   # of T_vec samples
% * T_vec:        vector(workers' CPU cycle time), 
% * N,mu,t_0,M,b: system para.                 
%% old
% function y = fun_Est_CDF(t,x_vec,num_sample,  N,mu,t_0,M,b)
% T_mat = exprnd(1/mu,[num_sample,N]) + t_0;
% y = fun_Est_CDF_T(t,x_vec,T_mat,M,N,b);
% end
%% new
function y = fun_Est_CDF(t,x_vec,num_sample,  N,mu,t_0,M,b)
num_sample_UB = 1e6;
if num_sample <= num_sample_UB
    T_mat = exprnd(1/mu,[num_sample,N]) + t_0;
    y = fun_Est_CDF_T(t,x_vec,T_mat,M,N,b);
else
    ratio = num_sample / num_sample_UB;
    ratio_int = round(ratio);
    y_buffer = zeros(ratio_int,1);
    for i = 1:ratio_int
        T_mat = exprnd(1/mu,[num_sample_UB,N]) + t_0;
        y_buffer(i) = fun_Est_CDF_T(t,x_vec,T_mat,M,N,b);
    end
    y = sum(y_buffer) / ratio_int;
end
end