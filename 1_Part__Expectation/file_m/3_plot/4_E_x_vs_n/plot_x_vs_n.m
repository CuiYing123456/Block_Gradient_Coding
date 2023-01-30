%% plot the structure of x
clc; clear;
%% -----------------------------------------------------------------------
% DESCRIPTIVE TEXT
% X axis:  Index n = 0,1,...,N-1
% Y axis:  x_n
% ------------------------------------------------------------------------
%% Colors for Plot by wq ==================
wq_r  = [0.85,0.33,0.10]; %  red     good
wq_b  = [0.07,0.62,1.00]; %  blue    good
wq_m  = [1.00,0.00,1.00]; %  magenta good
wq_g  = [0.47,0.67,0.19]; %  green   good
wq_p  = [0.49,0.18,0.56]; %  purple  good
wq_y  = [0.93,0.69,0.10]; %  yellow  good
wq_blue = [0.00,0.00,1.00]; %  blue2   good
wq_o  = [1.00,0.41,0.16]; %  orange  good
wq_black = [0.00,0.00,0.00]; %  black  good
%% System Parameter-------------------------------------------------------
% N = 20; L = 2e4; mu = 10^(-3); t_0 = 50;
% M = 1e4; iter_Max = 150;

N = 20;

load('x_opt_int.mat');
x_opt_int = x_get; clear x_get;
load('x_approx_t_int.mat');
x_approx_t_int = x_int_2; clear x_int_2;
load('x_approx_f_int.mat');
x_approx_f_int = x_int_2; clear x_int_2;

L1 = stem([0:N-1]',x_opt_int);
set(L1 , 'Color' , wq_blue , 'Marker' , '*');  %  red     good
hold on;
L2 = stem([0:N-1]',x_approx_t_int);
set(L2 , 'Color' , wq_m , 'Marker' , 'o');  %  blue    good
hold on;
L3 = stem([0:N-1]',x_approx_f_int);
set(L3 , 'Color' , wq_b , 'Marker' , '+');  %  blue    good

line = [L1 , L2 , L3];
set(line , 'LineWidth' , 2.5 , 'MarkerSize' , 12);
set(line , 'LineStyle','none');

legend = legend('\textbf{Proposed Optimal Solution $\check{\mathbf{x}}^{\rm (E,opt)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (E,t)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (E,f)}$}','Interpreter' , 'latex');
set(legend , 'FontSize' , 18);

xlabel('$n$' , 'Interpreter' , 'latex');
ylabel('$x_n$' ,'Interpreter', 'latex');
set(gca , 'XLim' , [0,N]          , 'XTick' , [0:N-1] , 'FontSize' , 20);
set(gca , 'YLim' , [0,6210]   ,                   'FontSize' , 20);


grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);


