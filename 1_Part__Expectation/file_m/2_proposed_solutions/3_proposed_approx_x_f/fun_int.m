function y = fun_int(p,q,mu,t_0)
    F = @(x) x.^(p-1).*(1-x).^(q-1) ./ (log(x)-mu*t_0);
    y = quadgk(F,0,1);
end