function y = fun_large_sampling_k(N)
    vector_xi = zeros(1,N);
    sum_zeta_0_nminus1 = 0;
    for n = 0:N-2
        % Step n -> generate k(n+1), i.e., k_{n} in journal
        vector_probility = zeros(1,n-sum_zeta_0_nminus1)+2;
        for zeta_n = 0:n-sum_zeta_0_nminus1+1
            vector_probility(zeta_n+1) = fun_large_Card(n+1-sum_zeta_0_nminus1-zeta_n,N-n-1) / fun_large_Card(n-sum_zeta_0_nminus1,N-n);
        end
        vector_xi(n+1) = randsrc(1,1,[ [0:n-sum_zeta_0_nminus1+1] ; vector_probility ]);
        sum_zeta_0_nminus1 = sum_zeta_0_nminus1 + vector_xi(n+1);
    end
    vector_xi(N) = N - sum(vector_xi);
    y = vector_xi';
end