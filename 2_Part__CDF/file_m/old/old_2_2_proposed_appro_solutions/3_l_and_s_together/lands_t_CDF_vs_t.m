%% proposed approx. solution at large t & small t
%%
clc; clear; clf;
%% Colors for Plot by wq ==================
wq_r     = [0.85,0.33,0.10]; %  red     good
wq_b     = [0.07,0.62,1.00]; %  blue    good
wq_m     = [1.00,0.00,1.00]; %  magenta good
wq_g     = [0.47,0.67,0.19]; %  green   good
wq_p     = [0.49,0.18,0.56]; %  purple  good
wq_y     = [0.93,0.69,0.10]; %  yellow  good
wq_blue  = [0.00,0.00,1.00]; %  blue2   good
wq_o     = [1.00,0.41,0.16]; %  orange  good
wq_black = [0.00,0.00,0.00]; %  black   good
%%
% L = 2e4; mu = 10^(-3);   num_sample = 1e4; N = 20; t_0 = 1; M = 50; b = 1; 
L = 2e4; mu = 10^(-3);  num_sample = 1e4; N = 50; t_0 = 130; M = 50; b = 1;
% t_table = 10 .^ [7.00:0.25:9.00];
% t_table = 10 .^ [8.00:0.05:9.00];
% t_table = 10 .^ [9.00:0.1:12.00];
t_table = 10^(8);
x_large = [L;zeros(N-1,1)]; % blue
x_small = [zeros(N-1,1);L]; % red
x_avg   = ones(N,1) * L/N;  % purple
test_para = 0;
% x_test  = [zeros(test_para,1);L;zeros(N-1-test_para,1)]; % black
x_test  = L / harmonic(N) * (1./[1:N]'); % black
%% CDF_vs_N
num_point = size(t_table,2);
CDF_est_large_t = zeros(num_point,1); % aim to plot num_point points
CDF_est_small_t = zeros(num_point,1); % aim to plot num_point points
CDF_est_avg_t   = zeros(num_point,1); % aim to plot num_point points
CDF_est_test_t  = zeros(num_point,1); % aim to plot num_point points
for i = 1:num_point
    t = t_table(i);
%     x_large = [L;zeros(N-1,1)];
    CDF_est_large_t(i) = fun_Est_CDF(t,x_large,num_sample, N,mu,t_0,M,b);
    CDF_est_small_t(i) = fun_Est_CDF(t,x_small,num_sample, N,mu,t_0,M,b);
    CDF_est_avg_t(i)   = fun_Est_CDF(t,x_avg,num_sample,   N,mu,t_0,M,b);
    CDF_est_test_t(i)  = fun_Est_CDF(t,x_test,num_sample,  N,mu,t_0,M,b);
end
% stem(CDF_est_avg_t;)
L1 = semilogx(t_table , CDF_est_large_t);
set(L1 , 'Color' , wq_b , 'Marker' , 'o');
hold on;
L2 = semilogx(t_table , CDF_est_small_t);
set(L2 , 'Color' , wq_r , 'Marker' , 'o');
hold on;
% L3 = semilogx(t_table , CDF_est_avg_t);
% set(L3 , 'Color' , wq_p , 'Marker' , 'o');
% L4 = semilogx(t_table , CDF_est_test_t);
% set(L4 , 'Color' , wq_p , 'Marker' , 'o');

% fig_legend = legend('\textbf{large t solution}' , '\textbf{small t solution}' , 'Interpreter' , 'latex');
% fig_legend = legend('\textbf{large t solution}' , '\textbf{small t solution}' , '\textbf{avg solution}' , 'Interpreter' , 'latex');
fig_legend = legend('\textbf{large t solution}' , '\textbf{small t solution}' , '\textbf{frac solution}' , 'Interpreter' , 'latex');
set(fig_legend , 'FontSize' , 14);

Line = [L1,L2];
set(Line , 'LineWidth' , 2.5 , 'MarkerSize' , 8);

title(['$t_0=$ ',num2str(t_0),', $N=$ ',num2str(N)] , 'Interpreter' , 'latex', 'FontSize' , 14);

grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);


