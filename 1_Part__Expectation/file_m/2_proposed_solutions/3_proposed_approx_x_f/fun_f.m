%% f(n ; mu, t_0) = e^{n \mu t_0}Ei(-n \mu t_0)
function y = fun_f(n,mu,t_0)
    y = exp(n * mu * t_0) * (-1) * expint(n * mu * t_0);
end