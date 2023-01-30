N = 20; mu = 1e-3; t_0 = 1;

t_vec = zeros(N,1); % t_1, .., t_N
m_vec = zeros(N,1); % m_1, .., m_N

for n = 1:N
    t_n = fun_t(n,N, mu,t_0);
end

for n = 2:N
    buffer_vec_1 = [1:n-1] .* circshift([1:n-1],1);
    buffer_vec_2 = 
end