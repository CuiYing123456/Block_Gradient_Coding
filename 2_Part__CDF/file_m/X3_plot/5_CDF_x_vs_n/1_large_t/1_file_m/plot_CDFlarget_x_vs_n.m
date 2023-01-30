%% plot the structure of x
clc; clear;
%% -----------------------------------------------------------------------
% DESCRIPTIVE TEXT
% X axis:  Index n = 0,1,...,N-1
% Y axis:  x_n
% ------------------------------------------------------------------------
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
%% System Parameter-------------------------------------------------------
% N = 20; L = 2e4; mu = 10^(-3); M = 50; b = 1; t_0 = 1; num_sample = 1e4;

N = 20;
% word =  [2778,1390,927,695,556,463,397,347,309,278,253,232,214,199,185,174,164,154,146,139];

% load('CDF_solution_structure.mat');
% x_CDF_large_t = x_get_int; clear x_get_int;
% load('x_approx_t_int.mat');
% x_approx_t_int = x_int_2; clear x_int_2;
% load('x_approx_f_int.mat');
% x_approx_f_int = x_int_2; clear x_int_2;

load('CDF_solution_structure_v1.mat')
x_CDF_large_t = fun_round_solution(x_get,sum(x_get));

L1 = stem([0:N-1]',x_CDF_large_t);
set(L1 , 'Color' , wq_blue , 'Marker' , 'o');  %  red     good
hold on;
% L2 = stem([0:N-1]',x_approx_t_int);
% set(L2 , 'Color' , wq_m , 'Marker' , 'v');  %  blue    good
% hold on;
% L3 = stem([0:N-1]',x_approx_f_int);
% set(L3 , 'Color' , wq_b , 'Marker' , '^');  %  blue    good

line = [L1];
set(line , 'LineWidth' , 2.5 , 'MarkerSize' , 12);

legend = legend('\textbf{Proposed Stationary point $\check{\mathbf{x}}^{\rm (CDF,sp)}$}','Interpreter' , 'latex');
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
set(gca , 'YLim' , [0,20000]   ,                   'FontSize' , 20);


grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);


