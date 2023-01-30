% calculate multinomial coefficients C_n^{k_1,k_2,...,k_m}
% input: n, (vextor) k
function y = fun_nchooseks(n,k)
m = length(k);
if m == 1
    y = nchoosek(n,k);
else
    y = nchoosek(n,k(1)) * fun_nchooseks(n-k(1),k(2:m));
end