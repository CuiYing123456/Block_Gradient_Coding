function y = fun_w_grad_u_g_0(u,k,N)
    y = - fun_large_Card(0,N)^1 * fun_large_nchooseks(N,k) * prod(exp(u).^k) * k;
end