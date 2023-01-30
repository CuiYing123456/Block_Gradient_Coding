clc; clear;
%% -----------------------------------------------------------------------
% DESCRIPTIVE TEXT
% X axis:  Exponential Distribution Parameter \mu
% Y axis:  CDF
% ------------------------------------------------------------------------
% Colors for Plot by wq ==================
wq_r  = [0.85,0.33,0.10]; %  red     good
wq_b  = [0.07,0.62,1.00]; %  blue    good
wq_m  = [1.00,0.00,1.00]; %  magenta good
wq_g  = [0.47,0.67,0.19]; %  green   good
wq_p  = [0.49,0.18,0.56]; %  purple  good
wq_y  = [0.93,0.69,0.10]; %  yellow  good
%% System Parameter-------------------------------------------------------
% mu = 10 .^ [-3.4 -3.2 -3.0 -2.8 -2.6];
% L = 1e4; N = 20; M = 50; b = 1; t = 7e7; t_0 = 1; num_sample = 1e4;
%% X axis
mu_axis = 10.^[-3.4:0.2:-2.6];
%% X axis      =[10-3.4         1e-3.2          1e-3.0          1e-2.8          1e-2.6]; 1e2.5
% Proposed Solutions
% prop_continuous=[23.4           16.3            11.6            8.616           6.3611          4.84      ]*1e7;
prop_integer   =[0.695          0.867           0.956           0.997           0.999];
% Baseline 1
Single_BCGC    =[0.674          0.828           0.938           0.988           0.999]; 
% % Baseline X
% uniform_layer  =[0.004          0.112           0.594           0.951           0.999];
% Baseline 2: [Tandon]
Tandon         =[0.004          0.112           0.594           0.951           0.999]; 
% Baseline 3: [Draper]
Draper_r_L     =[0.675          0.825           0.938           0.988           0.999];
% Baseline 4:
Draper_r_L_D_2 =[0.605          0.831           0.955           0.995           0.999];

l_proposed    = semilogx(mu_axis,prop_integer);     hold on;
l_baseline_1  = semilogx(mu_axis,Single_BCGC);         hold on;
l_baseline_2  = semilogx(mu_axis,Tandon);              hold on;
l_baseline_31 = semilogx(mu_axis,Draper_r_L);          hold on;
l_baseline_32 = semilogx(mu_axis,Draper_r_L_D_2);      hold on;
set(l_proposed    , 'Color' , wq_r , 'Marker' , '*'); %  red     good
set(l_baseline_1  , 'Color' , wq_b , 'Marker' , 'o'); %  blue    good
set(l_baseline_2  , 'Color' , wq_m , 'Marker' , '+'); %  magenta good
set(l_baseline_31 , 'Color' , wq_p , 'Marker' , '^'); %  purple  good
set(l_baseline_32 , 'Color' , wq_g , 'Marker' , 'd'); %  green  good

line = [l_proposed , l_baseline_1 , l_baseline_2 , l_baseline_31 , l_baseline_32];
set(line , 'LineWidth' , 2.5 , 'MarkerSize' , 16);

fig_legend = legend('\textbf{Proposed Stationary Point $\check{\mathbf{x}}^{\rm (CDF,sp)}$}','\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} (r=L)}','\textbf{Ferdinand \emph{et al.} (r=L/8)}' , 'Interpreter' , 'latex');
set(fig_legend , 'FontSize' , 18);

xlabel('Rate Parameter $\mu$' , 'Interpreter' , 'latex');
ylabel('CDF' ,'Interpreter','latex');
set(gca , 'XLim' , [10^(-3.4),10^(-2.6)] , 'XTick' , 10.^[-3.4 -3.2 -3.0 -2.8 -2.6] ,  'FontSize' , 20);
set(gca , 'XTickLabel' , {'10^{-3.4}','10^{-3.2}','10^{-3.0}','10^{-2.8}','10^{-2.6}'});
set(gca , 'YLim' , [0.6,1]   ,                        'FontSize' , 20);
% set(gca , 'YTickLabel' , {'10^{7.6}','10^{8}','10^{8.4}','10^{8.8}'});

grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);