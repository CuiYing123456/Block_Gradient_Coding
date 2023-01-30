
%%
clear;
N = 1000;
y = zeros(1,N-1);
for n = 2:N-1
    y(n) = nchoosek(N,n)^(1/(N-n));
end
n = 1:N-1;
stem(n,y);

%%
clear;
y = zeros(1,100);
for N = 2:100
    y(N) = (N*(N-1)/2)^(1/(N-2));
end
N = 1:100;
stem(N,y);