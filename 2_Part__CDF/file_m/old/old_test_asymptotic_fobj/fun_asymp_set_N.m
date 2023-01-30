function [set_N,minimum] = fun_asymp_set_N(x,set_N_1)

vec_buffer = zeros(length(set_N_1),1);     
for i = 1:length(set_N_1)
    n = set_N_1(i);
    vec_buffer(i) = (n+1) / ([1:(n+1)]*x(1:(n+1)));
end
minimum = min(vec_buffer);
index_vec = find( vec_buffer == minimum );
set_N = index_vec - 1;

end