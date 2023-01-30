function y = fun_w_grad_w_g_1(w,N)
    y = pow_p( [[1:N-1].*[2:N],N]' .* pow_p(w,2) , -1 );
end