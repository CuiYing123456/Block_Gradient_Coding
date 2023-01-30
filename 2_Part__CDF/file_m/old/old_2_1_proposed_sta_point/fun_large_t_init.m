function y = fun_large_t_init(N,L)

x_0 = L / sum(1 ./ [1:N]);
y = (1./[1:N]') * x_0;

end