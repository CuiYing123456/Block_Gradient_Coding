%% calculate large nchoosek
function y = fun_large_nchoosek(n,m)
    ln_nchoosek = sum(log([m+1:n])) - sum(log([2:n-m]));
    y = exp(ln_nchoosek);
end