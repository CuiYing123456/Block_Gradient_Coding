function y = fun_t(n,N, mu,t_0)

y = (harmonic(N) - harmonic(N-n) ) / mu + t_0;

end