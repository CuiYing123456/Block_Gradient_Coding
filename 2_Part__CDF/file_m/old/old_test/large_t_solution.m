%%
clear;
L = 1000; N = 10;

cvx_begin
cvx_solver mosek
    variables x(N) 
	minimize( x(1) + 2*x(2) )
	subject to
        sum(x) == L;
        for n = 3:N
            [1,2] * x(1:2) >= 2/(n-2)*[3:n] * x(3:n);
        end
        x >= zeros(N,1);
cvx_end
%%
clear;
L = 1000; N = 10;
cvx_begin
cvx_solver mosek
    variables x(N) u
	minimize( u )
	subject to
        sum(x) == L;
        x >= zeros(N,1);
        for n = 2:N
            [1:n] * x(1:n) / n <= u;
        end
cvx_end

buffer_vec = [];
for n = 2:N
    buffer_vec = [buffer_vec , [1:n] * x(1:n) / n];
end
[max_value,index] =  max(buffer_vec);


