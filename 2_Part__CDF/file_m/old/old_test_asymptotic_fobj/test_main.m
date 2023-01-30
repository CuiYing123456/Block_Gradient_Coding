clear;
clc;
% ------------------------------------------------------------------------
%% Colors for Plot by wq ==================
wq_r  = [0.85,0.33,0.10]; %  red     good
wq_b  = [0.07,0.62,1.00]; %  blue    good
wq_m  = [1.00,0.00,1.00]; %  magenta good
wq_g  = [0.47,0.67,0.19]; %  green   good
wq_p  = [0.49,0.18,0.56]; %  purple  good
wq_y  = [0.93,0.69,0.10]; %  yellow  good
wq_b2 = [0.00,0.00,1.00]; %  blue2   good
% ------------------------------------------------------------------------
%%
N = 20; 
L = 2e4;
mu = 1e-3; 
M = 50; b = 1; 
% t = 1*10^(8.5);
t_0 = 1; 
num_sample = 1e4;

x = [L;zeros(N-1,1)];

% Est_CDF = fun_Est_CDF(t,x,num_sample,  N,mu,t_0,M,b);
% fprintf(2,['Est_CDF = ', num2str(Est_CDF), '\n']);
% Asymp_CDF = fun_asymtotic_CDF(t,x, mu,t_0,M,b);
% fprintf(2,['Asymp_CDF = ', num2str(Asymp_CDF), '\n']);

t_power = 8.5:0.01:9.0;
Est_CDF = zeros(1,length(t_power));
Asymp_CDF = zeros(1,length(t_power));
% t = 10 ^ t_power;
for i = 1:length(t_power)
    t = 10 ^ t_power(i);
    Est_CDF(i) = fun_Est_CDF(t,x,num_sample,  N,mu,t_0,M,b);
%     fprintf(2,['Est_CDF = ', num2str(Est_CDF), '\n']);
    Asymp_CDF(i) = fun_asymtotic_CDF(t,x, mu,t_0,M,b);
    %     fprintf(2,['Asymp_CDF = ', num2str(Asymp_CDF), '\n']);
end

l_Est   = plot(t_power,Est_CDF); hold on;
l_Asymp = plot(t_power,Asymp_CDF);

set(l_Est    , 'Color' , wq_r , 'Marker' , '*'); %  red     good
set(l_Asymp  , 'Color' , wq_b , 'Marker' , 'o'); %  blue    good
