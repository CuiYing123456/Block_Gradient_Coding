%% Generate random vector K = (X_1, X_2, ..., X_N)
% use N Steps
% output: y -> N x 1 vector

% function y = fun_sampling_k(N)
% vector_k = zeros(1,N);
% index_k = 0;
% for i = 1:N-1
%     % Step i -> generate k_i
%     vector_probility = zeros(1,index_k+2);
%     for j = 0 : index_k + 1
%         vector_probility(j+1) = fun_Card(index_k+1-j,N-i) / fun_Card(index_k,N-i+1);   
%     end
%     vector_k(i) = randsrc(1,1,[ [0:index_k+1] ; vector_probility ]);
%     index_k = index_k + 1 - vector_k(i);
% end
% vector_k(N) = N - sum(vector_k);
% y = vector_k';
% end

function y = fun_sampling_k(N)
    vector_xi = zeros(1,N);
    sum_zeta_0_nminus1 = 0;
    for n = 0:N-2
        % Step n -> generate k(n+1), i.e., k_{n} in journal
        vector_probility = zeros(1,n-sum_zeta_0_nminus1)+2;
        for zeta_n = 0:n-sum_zeta_0_nminus1+1
            vector_probility(zeta_n+1) = fun_Card(n+1-sum_zeta_0_nminus1-zeta_n,N-n-1) / fun_Card(n-sum_zeta_0_nminus1,N-n);
        end
        vector_xi(n+1) = randsrc(1,1,[ [0:n-sum_zeta_0_nminus1+1] ; vector_probility ]);
        sum_zeta_0_nminus1 = sum_zeta_0_nminus1 + vector_xi(n+1);
    end
    vector_xi(N) = N - sum(vector_xi);
    y = vector_xi';
end