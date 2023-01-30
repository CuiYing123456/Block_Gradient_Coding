clear;
% F = @(x) x.^2;
% Q = quadl(@(x)F(x),0,1)

F = @(x) x.^(8-1).*(1-x).^(35-8+1-1) ./ (log(x)-10^(-3));
Q = quadl(F,0,1)
Q = quadgk(F,0,1)
