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
wq_bl = [0.00,0.00,0.00]; %  black   good
wq_o  = [1.00,0.41,0.16]; %  orange  good
%% System Parameter - ok ------------------------------------------------------
% mu = 10 .^ [-1 -0.9 -0.8 -0.7 -0.6]; 
% L = 4e4; N = 20; M = 50; b = 1; t = 10^(6.5); t_0 = 1; num_sample = 1e4;
%% X axis
mu_axis = 10.^[-1:0.1:-0.6];
%% X axis           = 10 .^ [-1             -0.9            -0.8            -0.7            -0.6 ]; 
% Proposed Solutions
prop_sta_point      =       [0.910          0.972           0.993           0.999           1.000];
prop_approx_lg      =       [0.760          0.933           0.990           0.999           1.000];

% Baseline 1
Single_BCGC         =       [0.686          0.768           0.855           0.935           0.991]; 
% % Baseline X
% uniform_layer  =[0.004          0.112           0.594           0.951           0.999];
% Baseline 2: [Tandon]
Tandon              =       [0.689          0.886           0.970           0.995           0.997]; 
% Baseline 3: [Draper]
Draper_r_L          =       [0.687          0.768           0.841           0.902           0.945];
% Baseline 4:
Draper_r_L_D_2      =       [0.525          0.651           0.767           0.864           0.935];

L_prop_sta_point  = semilogx(mu_axis,prop_sta_point);      hold on;
L_prop_approx_lg  = semilogx(mu_axis,prop_approx_lg);      hold on;
L_Single_BCGC     = semilogx(mu_axis,Single_BCGC);         hold on;
L_Tandon          = semilogx(mu_axis,Tandon);              hold on;
L_Draper_r_L      = semilogx(mu_axis,Draper_r_L);          hold on;
L_Draper_r_L_D_2  = semilogx(mu_axis,Draper_r_L_D_2,'--');      hold on;

set(L_prop_sta_point , 'Color' , wq_b , 'Marker' , '*'); %  red     good
set(L_prop_approx_lg , 'Color' , wq_m , 'Marker' , 'o'); %  yellow  good
set(L_Single_BCGC    , 'Color' , wq_o , 'Marker' , 's'); %  blue    good
set(L_Tandon         , 'Color' , wq_p , 'Marker' , 'd'); %  magenta good
set(L_Draper_r_L     , 'Color' , wq_g , 'Marker' , '^'); %  purple  good
set(L_Draper_r_L_D_2 , 'Color' , wq_g , 'Marker' , '^'); %  green   goo

line = [L_prop_sta_point , L_prop_approx_lg , L_Single_BCGC , L_Tandon , L_Draper_r_L , L_Draper_r_L_D_2];
set(line , 'LineWidth' , 2.5 , 'MarkerSize' , 16);

% fig_legend = legend('\textbf{Proposed Stationary Point $\check{\mathbf{x}}^{\rm (CDF,st)}$}',...
%     '\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} ($r=L$)}',...
%     '\textbf{Ferdinand \emph{et al.} ($r=L/8$)}' , 'Interpreter' , 'latex');
% set(fig_legend , 'FontSize' , 18);

xlabel('Rate Parameter $\mu$' , 'Interpreter' , 'latex');
ylabel('Completion Probability' ,'Interpreter' , 'latex');
set(gca , 'XLim' , [10^(-1),10^(-0.6)] , 'XTick' , 10.^[-1 -0.9 -0.8 -0.7 -0.6] ,  'FontSize' , 20);
set(gca , 'XTickLabel' , {'10^{-1}','10^{-0.9}','10^{-0.8}','10^{-0.7}','10^{-0.6}','10^{-0.5}'});
set(gca , 'YLim' , [0.5,1]   ,                        'FontSize' , 20);
% set(gca , 'YTickLabel' , {'10^{7.6}','10^{8}','10^{8.4}','10^{8.8}'});

%%
% grid on;
% 
% fig_legend_1 = legend( line(1:2), '\textbf{Proposed Stationary Point $\check{\mathbf{x}}^{\rm (CDF, st)}$}' , ...
%     '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,lg)}$}' , 'Interpreter' , 'latex');
% set(gca,'FontSize',18);
% ah_1 = axes('position',get(gca,'position'),'visible','off');
% 
% fig_legend_2 = legend( ah_1 , line(3:6) , '\textbf{Single BCGC}','\textbf{Tandon \emph{et al}.}','\textbf{Ferdinand \emph{et al.} ($r=L$)}',...
%     '\textbf{Ferdinand \emph{et al.} ($r=L/2$)}' , 'Interpreter' , 'latex');
% set(gca,'FontSize',18);
% ah_2 = axes('position',get(gca,'position'),'visible','off');
% set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);
%%
fig_legend = legend('\textbf{Proposed Stationary Point $\check{\mathbf{x}}^{\rm (CDF,st)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,lg)}$}',...
    '\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} ($r=L$)}',...
    '\textbf{Ferdinand \emph{et al.} ($r=L/2$)}' , 'Interpreter' , 'latex');
set(fig_legend , 'FontSize' , 18);

grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);