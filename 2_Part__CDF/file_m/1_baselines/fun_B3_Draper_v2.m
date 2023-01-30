function y = fun_B3_Draper_v2(N, t, L, mu, t_0, M, b, num_sample, alpha_we_use)
%% Baseline 3's design
r = L / alpha_we_use;
cvx_begin
    variables s(r) u
    maximize ( u )
    subject to
        for j = 1:r
            u <= ( s(j) + 1 ) / j;
        end
        sum(s) == N * r - L;
        for j = 1:r-1
            s(j) <= s(j+1);
        end
        s(1) >= 0;
        s(r) <= N-1;    
cvx_end
%% round s
s_continuous = s;
s_integer = round(s_continuous);
%% calculate x in our work
vector_s_L = [];
for i = 1:r
    vector_s_L = [vector_s_L ; s_integer(i)*ones(N-s_integer(i),1)];    
end
x_baseline_3 = zeros(N,1);
for i=1:N
    x_baseline_3(i) = size( find(vector_s_L == i-1) , 1 );
end
%% estimate CDF
CDF_est_basline_3 = fun_Est_CDF(t,x_baseline_3,num_sample,  N,mu,t_0,M,b);
y = CDF_est_basline_3;
end