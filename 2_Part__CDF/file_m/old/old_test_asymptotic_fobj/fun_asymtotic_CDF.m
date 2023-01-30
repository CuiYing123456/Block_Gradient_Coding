function y = fun_asymtotic_CDF(t,vec_x, mu,t_0,M,b)

N = size(vec_x,1);
set_N_1 = find(vec_x ~= 0) - 1;
[set_N,minimum] = fun_asymp_set_N(vec_x,set_N_1);

factor_1 = 0;
for i = 1:length(set_N)
    n = set_N(i);
    factor_1 = factor_1 + nchoosek(N,n+2) * exp(mu*t_0*(n+2));
end

factor_2 = exp(-mu*N/M/b * minimum * t);

y = 1 - factor_1 * factor_2;

end