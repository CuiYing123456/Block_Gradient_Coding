function y = fun_cal_CDF_sparse(u,N,B)
    indicator_vec = (u == -inf);
    y = fun_cal_CDF_recursion_sparse(u,N,B,[],indicator_vec);
end