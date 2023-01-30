function x = fun_cal_large_t_solution(N,L)

x = zeros(N,1);
x(1) = 2 * L / ( harmonic(N)+1/2 );
x(3:N) = 1./[6:2:2*N] * x(1);

end