%% Generate sorrogate function of objective function
function y = fun_w_bar_f_0i( u , w , u_i , w_i , k_i , f_italic_0_i , f_full_0_i , N , pho_i , tau_0 )
%     tau_0 = 10^floor(log10(abs( fun_w_g_0(u_i,k_i,N) )));
    y = (1-pho_i) * (f_italic_0_i + f_full_0_i' * (u-u_i)) + pho_i * ( fun_w_g_0(u_i,k_i,N) + fun_w_grad_u_g_0(u_i,k_i,N)' ...
        * (u-u_i) ) + tau_0 * ( sum_square_abs(u-u_i) + sum_square_abs(w-w_i));

%     y = (1-pho_i) * (f_italic_0_i + f_full_0_i' * (u-u_i)) + pho_i * ( fun_g_0(u_i,k_i,N) + fun_grad_u_g_0(u_i,k_i,N)' ...
% * (u-u_i) ) + tau_0 * ( sum_square_abs(u-u_i) + sum_square_abs(y-y_i) );
end

