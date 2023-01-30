function y = fun_large_Card(m,N)
    y = (m+2) / (m+N+1) * fun_large_nchoosek(m+2*N-1,N-1);
end