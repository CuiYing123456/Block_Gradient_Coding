function y =  fun_w_g_1(w,N,L,mutN__Mb)
    y = L / mutN__Mb - sum( pow_p([[1:N-1].*[2:N],N]' .* w , -1) );
end