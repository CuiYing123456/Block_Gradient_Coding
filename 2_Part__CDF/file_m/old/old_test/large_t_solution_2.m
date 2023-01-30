clear;

L = 1000; N = 10;
m = 1;

cvx_clear
cvx_begin
cvx_solver mosek
    variables x(N) 
	minimize( [1:m+2] * x(1:m+2) / (m+2) )
	subject to
        sum(x) == L;
        x >= zeros(N,1);
        
        for j = 0:N-2
            if j == m
                break;
            else
                [1:m+2] * x(1:m+2) / (m+2) >= [1:j+2] * x(1:j+2) / (j+2);
            end
        end
cvx_end

buffer_vec = [];
for n = 2:N
    buffer_vec = [buffer_vec ; [1:n] * x(1:n) / n];
end
[max_value,index] =  max(buffer_vec);
