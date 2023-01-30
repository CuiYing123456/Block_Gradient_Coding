clc; clear;
%% CDF maximization -----------------------------------------------------------------------
% DESCRIPTIVE TEXT
% X axis:  Number of Users t
% Y axis:  CDF
% ------------------------------------------------------------------------
%% Colors for Plot by wq ==================
wq_r  = [0.85,0.33,0.10]; %  red     good
wq_b  = [0.07,0.62,1.00]; %  blue    good
wq_m  = [1.00,0.00,1.00]; %  magenta good
wq_g  = [0.47,0.67,0.19]; %  green   good
wq_p  = [0.49,0.18,0.56]; %  purple  good
wq_y  = [0.93,0.69,0.10]; %  yellow  good
wq_b2 = [0.00,0.00,1.00]; %  blue2   good
%% System Parameter-------------------------------------------------------
% t = 10 .^ [7.0 7.5 8.0 8.25 8.5 9.0]; 
% N = 20;   L = 2e4;   mu = 1e-3;   t_0 = 1;
% M =  50;    b =    1;
% iter_Max = 200;    num_sample = 1e4;    batchsize = 3e2;    tausize = 1e2;
%% X axis
% t_axis = 10 .^ [6.5 7.0 7.5 8.0 8.25 8.5 9.0];
t_axis = 10 .^ [7.00:0.25:9.00];
%% X axis           = [10^(7.00)          10^(7.25)          10^(7.50)          10^(7.75)          10^(8.00)          10^(8.25)          10^(8.50)          10^(8.75)          10^(9.00)];
% Proposed Solution
prop_integer        = [0.167              0.289              0.481              0.694              0.881              0.978              0.999              1.000              1.000    ];
prop_large_t        = [0.000              0.000              0.000              0.002              0.185              0.915              0.999              1.000              1.000    ];
% Baseline 1 - single BCGC
Single_BCGC         = [0.161              0.275              0.449              0.658              0.856              0.967              0.997              1.000              1.000    ];
% Baseline 2: [Tandon, partial straggler]
Tandon              = [0.000              0.000              0.000              0.004              0.206              0.836              0.997              1.000              1.000    ];
% Baseline 3: [Draper]
Draper_r_L          = [0.162              0.275              0.455              0.660              0.853              0.971              0.999              1.000              1.000    ];

Draper_r_L_D_2      = [0.021              0.059              0.157              0.368              0.666              0.920              0.995              1.000              1.000    ];

l_proposed    = semilogx(t_axis,prop_integer);        hold on;
l__large_t    = semilogx(t_axis,prop_large_t);        hold on;
l_baseline_1  = semilogx(t_axis,Single_BCGC);         hold on;
l_baseline_2  = semilogx(t_axis,Tandon);              hold on;
l_baseline_31 = semilogx(t_axis,Draper_r_L);          hold on;
l_baseline_32 = semilogx(t_axis,Draper_r_L_D_2);      hold on;

set(l_proposed    , 'Color' , wq_r , 'Marker' , '*'); %  red     good
set(l__large_t    , 'Color' , wq_b2 , 'Marker' , '*'); %  yellow  good
set(l_baseline_1  , 'Color' , wq_b , 'Marker' , 'o'); %  blue    good
set(l_baseline_2  , 'Color' , wq_m , 'Marker' , '+'); %  magenta good
set(l_baseline_31 , 'Color' , wq_p , 'Marker' , '^'); %  purple  good
set(l_baseline_32 , 'Color' , wq_g , 'Marker' , 'd'); %  green  good

line = [l_proposed , l__large_t , l_baseline_1 , l_baseline_2 , l_baseline_31 , l_baseline_32];
set(line , 'LineWidth' , 2.5 , 'MarkerSize' , 16);
grid on;

xlabel('Threshold  $t$' , 'Interpreter' , 'latex');
ylabel('Completion Probability' , 'Interpreter' , 'latex');
% ----------------------------------
% fig_legend = legend('Proposed Stationary Point $\check{x}^{\rm lg}$', 'Proposed Approximate Solution' , 'Single BCGC','Tandon {\itet al.}','Ferdinand {\itet al.} (r=L)','Ferdinand {\itet al.} (r=L/8)' , 'Interpreter' , 'latex');
% fig_legend = legend('Proposed Stationary Point $\check{\mathbf{x}}^{\dag}$' , 'Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (lg)}$' , 'Single BCGC','Tandon \emph{et al}.','Ferdinand \emph{et al.} (r=L)','Ferdinand \emph{et al.} (r=L/8)' , 'Interpreter' , 'latex');
% ----------------------------------
fig_legend_1 = legend( line(1:2), '\textbf{Proposed Stationary Point $\check{\mathbf{x}}^{\rm (CDF,sp)}$}' , '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,l)}$}' , 'Interpreter' , 'latex');
set(gca,'FontSize',18);
ah_1 = axes('position',get(gca,'position'),'visible','off');

fig_legend_2 = legend( ah_1 , line(3:6) , '\textbf{Single BCGC}','\textbf{Tandon \emph{et al}.}','\textbf{Ferdinand \emph{et al.} (r=L)}','\textbf{Ferdinand \emph{et al.} (r=L/8)}' , 'Interpreter' , 'latex');
set(gca,'FontSize',18);
ah_2 = axes('position',get(gca,'position'),'visible','off');


% set(fig_legend_1 , 'FontSize' , 18 , 'FontWeight' , 'bold');
% set(fig_legend_2 , 'FontSize' , 18 , 'FontWeight' , 'bold');



set(gca , 'XLim' , [10^(7),10^(9)] , 'XTick' , 10.^[7.00 7.25 7.50 7.75 8.00 8.25 8.50 8.75 9.00] ,  'FontSize' , 20);
set(gca , 'XTickLabel' , {'10^{7.0}','10^{7.25}','10^{7.5}','10^{7.75}','10^{8.0}','10^{8.25}','10^{8.5}','10^{8.75}','10^{9.0}'});
set(gca , 'YLim' , [0,1]   ,                        'FontSize' , 20);
% set(gca , 'YTickLabel' , {'10^{7.6}','10^{8}','10^{8.4}','10^{8.8}'});

% grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);

