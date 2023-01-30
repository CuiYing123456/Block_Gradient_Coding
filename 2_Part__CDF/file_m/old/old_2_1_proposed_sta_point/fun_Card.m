%% Calculate the Card(S_k(n))
function y = fun_Card(m,N)
    y = (m+2) / (m+N+1) * nchoosek(m+2*N-1,N-1);
end