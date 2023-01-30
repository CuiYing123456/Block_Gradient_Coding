function [y_1,y_2] = fun_B2_Tandon(N, t, L, mu, t_0, M, b, ~)
MbL__N = M * b * L / N;

mutN__Mb = mu * t * N / (M * b);
I = eye(N); %for extracting unit vector e_i
A = exp(-mutN__Mb); B = exp(mu * t_0);
%% Baseline 2's design
alpha_Tandon = 6;
CDF_vector = zeros(1,N);
for s_Tandon = 0:N-1
    sum_scalar = 0;
    for i = N-s_Tandon:N
        sum_scalar = sum_scalar + nchoosek(N,i) ...
        * fun_B2_CDF_exp( t / ( MbL__N*(s_Tandon+1)/(s_Tandon+alpha_Tandon)*alpha_Tandon ) , mu , t_0 )^i ...
        * ( fun_B2_CDF_exp( t / ( MbL__N*(s_Tandon+1)/(s_Tandon+alpha_Tandon) ) , mu , t_0 ) ...
            - fun_B2_CDF_exp( t / ( MbL__N*(s_Tandon+1)/(s_Tandon+alpha_Tandon)*alpha_Tandon ) , mu , t_0 ) )^(N-i);
    end
    CDF_vector(s_Tandon+1) = sum_scalar;
end
[CDF_basline_2 , index_s] = max(CDF_vector);
y_1 = CDF_basline_2;
y_2 = index_s;
end