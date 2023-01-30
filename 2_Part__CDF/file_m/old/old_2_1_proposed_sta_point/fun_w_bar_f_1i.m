function y = fun_bar_f_i1( u , w , u_i , w_i , f_italic_1_i , f_full_1_i , N , L , pho_i , tau_1 , mutN__Mb)
%     tau_1 = 10^floor( log10( abs( fun_w_g_1(w_i,N,L,mutN__Mb) ) ) );
    y = (1-pho_i) * (f_italic_1_i + f_full_1_i' * (w-w_i)) + pho_i * ( fun_w_g_1(w_i,N,L,mutN__Mb) + fun_w_grad_w_g_1(w_i,N)'...
        * (w-w_i) ) + tau_1 * ( sum_square_abs(w-w_i) + sum_square_abs(u-u_i) );

% y = (1-pho_i) * (f_italic_1_i + f_full_1_i' * (y-y_i)) + pho_i * ( fun_g_1(y_i,N,L) + fun_grad_y_g_1(y_i,N)' * (y-y_i) ) ...
% + tau_1 * ( sum_square_abs(u-u_i) + sum_square_abs(y-y_i) );
end