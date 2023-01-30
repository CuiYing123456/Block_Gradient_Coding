%% plot the structure of x
clc; clear;
%% -----------------------------------------------------------------------
% DESCRIPTIVE TEXT
% X axis:  Index n = 0,1,...,N-1
% Y axis:  x_n
% ------------------------------------------------------------------------
%% Colors for Plot by wq ==================
wq_r     = [0.85,0.33,0.10]; %  red     good
wq_b1    = [0.07,0.62,1.00]; %  blue    good
wq_m     = [1.00,0.00,1.00]; %  magenta good
wq_g     = [0.47,0.67,0.19]; %  green   good
wq_p     = [0.49,0.18,0.56]; %  purple  good
wq_y     = [0.93,0.69,0.10]; %  yellow  good
wq_b2    = [0.00,0.00,1.00]; %  blue2   good
wq_o     = [1.00,0.41,0.16]; %  orange  good
wq_bl    = [0.00,0.00,0.00]; %  black   good
%% System Parameter-------------------------------------------------------
% N = 20; L = 2e4; mu = 10^(-3); M = 50; b = 1; t_0 = 1; num_sample = 1e4;

N = 20; L = 4e4;
% word =  [2778,1390,927,695,556,463,397,347,309,278,253,232,214,199,185,174,164,154,146,139];

% load('CDF_solution_structure.mat');
% x_CDF_large_t = x_get_int; clear x_get_int;
% load('x_approx_t_int.mat');
% x_approx_t_int = x_int_2; clear x_int_2;
% load('x_approx_f_int.mat');
% x_approx_f_int = x_int_2; clear x_int_2;

% load('CDF_x_vs_n.mat');
load('CDF_x_vs_n_t_1e8.mat');
x_CDF_st_large_t     = x_get_int;
load('CDF_x_vs_n_t_1e6.mat');
x_CDF_st_middle_t    = x_get_int;
x_CDF_approx_large_t  = fun_cal_large_t_solution_nozero(N,L);

L1 = stem([0:N-1]',x_CDF_st_middle_t);
set(L1 , 'Color' , wq_r , 'Marker' , '+');  %  red     good
hold on;
L2 = stem([0:N-1]',x_CDF_st_large_t);
set(L2 , 'Color' , wq_b1, 'Marker' , '*');  %  blue    good
hold on;
L3 = stem([0:N-1]',x_CDF_approx_large_t);
set(L3 , 'Color' , wq_m , 'Marker' , 'o');  %  blue    good

line = [L1,L2,L3];
set(line , 'LineWidth' , 2.5 , 'MarkerSize' , 12);
set(line , 'LineStyle','none');
legend = legend('\textbf{Proposed Stationary point $\check{\mathbf{x}}^{\rm (CDF,st)}$ at $t=10^{6}$}' , ...
    '\textbf{Proposed Stationary point $\check{\mathbf{x}}^{\rm (CDF,st)}$ at $t=10^{8}$}' , ...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,lg)}$}' , 'Interpreter' , 'latex');
set(legend , 'FontSize' , 18);

% ---- annotate -------------------------------------------------------------
% L = num2str(x_CDF_large_t');
% L_split = strsplit(L);
% for i = 1:length(x_CDF_large_t)
%     text(i-1-0.3,x_CDF_large_t(i)+100,L_split{i},'Color','blue','FontSize',10);
% end
% ---------------------------------------------------------------------------

xlabel('$n$' , 'Interpreter' , 'latex');
ylabel('$x_n$' ,'Interpreter', 'latex');
set(gca , 'XLim' , [0,N]          , 'XTick' , [0:N-1] , 'FontSize' , 20);
set(gca , 'YLim' , [0,18000]   ,                   'FontSize' , 20);


grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);


