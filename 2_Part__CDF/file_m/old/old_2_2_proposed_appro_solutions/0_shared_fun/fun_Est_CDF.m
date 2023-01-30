%%
% function: estimate CDF by sampling T_1, ... , T_N
% * t:            time threshold
% * x_vec:        solution, N x 1
% * num_sample:   # of T_vec samples
% * T_vec:        vector(workers' CPU cycle time), 
% * N,mu,t_0,M,b: system para.                 

function y = fun_Est_CDF(t,x_vec,num_sample,  N,mu,t_0,M,b)

T_mat = exprnd(1/mu,[num_sample,N]) + t_0;
y = fun_Est_CDF_T(t,x_vec,T_mat,M,N,b);

end