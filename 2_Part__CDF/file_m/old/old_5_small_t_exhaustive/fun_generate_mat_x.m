%% return: mat. C(L+N-1,N-1) x N

function mat_x = fun_generate_mat_x(N,L)
if L == 0
    mat_x = zeros(1,N);
elseif N == 1
    mat_x = L;
else
    mat_x = [];
    for i = 0:L
        mat_x = [mat_x;[i*ones(nchoosek(L-i+N-2,N-2),1),fun_generate_mat_x(N-1,L-i)]];
    end
end