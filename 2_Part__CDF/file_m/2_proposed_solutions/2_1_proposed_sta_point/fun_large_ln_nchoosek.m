function y = fun_large_ln_nchoosek(n,m)
    ln_nchoosek = sum(log([m+1:n])) - sum(log([2:n-m]));
    y = ln_nchoosek;
end