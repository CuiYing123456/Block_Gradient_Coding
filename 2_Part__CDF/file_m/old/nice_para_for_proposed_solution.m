%%
% function: calculate N(x)
% INPUT
% * x_vec: N x 1
% * N:     
% OUTPUT
% * y_vec: colume vector
%          It is set N.

function y_vec = fun_N(x_vec,N)

buffer_vec = zeros(N-1,1);
for n = 0:N-2
    buffer_vec(n+1) = (n+2) / ( [1:n+2] * x(1:n+2) );
end
M = max(buffer_vec);
y_vec = find(buffer_vec == M);