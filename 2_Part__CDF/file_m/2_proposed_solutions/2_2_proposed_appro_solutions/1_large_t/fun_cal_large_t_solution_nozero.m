function x = fun_cal_large_t_solution_nozero(N,L)

m = L / harmonic(N);
x = 1 ./ [1:N]' * m;

end