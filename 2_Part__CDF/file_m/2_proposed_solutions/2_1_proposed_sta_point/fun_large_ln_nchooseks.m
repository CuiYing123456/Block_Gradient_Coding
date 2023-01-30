function y = fun_large_ln_nchooseks(n,k)
m = length(k);
if m == 1
    y = fun_large_ln_nchoosek(n,k);
else
    y = fun_large_ln_nchoosek(n,k(1)) + fun_large_ln_nchooseks(n-k(1),k(2:m));
end