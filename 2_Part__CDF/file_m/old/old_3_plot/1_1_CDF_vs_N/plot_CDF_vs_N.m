clc; clear;
%% CDF maximization -----------------------------------------------------------------------
% DESCRIPTIVE TEXT
% X axis:  Number of Users N
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
% N = [10 20 30 40 50]; 
% L = 2e4;   mu = 1e-3;   t = 7e7;   t_0 = 1;
% M =  50;    b =    1;
% iter_Max = 200;    num_sample = 1e4;    batchsize = 3e2;    tausize = 1e2;
%% X axis
N_axis = [10:10:50];
%% X axis           = [10                20                   30                 40                   50         ];
% Proposed Solution
prop_continuous     = [0.511             0.765                0.900              0.954                0.980];
% Baseline 1 - single BCGC
Single_BCGC         = [0.496             0.756                0.877              0.934                0.968];
% Baseline 2: [Tandon, partial straggler]
Tandon              = [0.013             0.026                0.082              0.211                0.400];
% Baseline 3: [Draper]
Draper_r_L          = [0.507             0.748                0.865              0.935                0.969];

Draper_r_L_D_8      = [0.209             0.476                0.653              0.876                0.949];

l_proposed    = plot(N_axis,prop_continuous);     hold on;
l_baseline_1  = plot(N_axis,Single_BCGC);         hold on;
l_baseline_2  = plot(N_axis,Tandon);              hold on;
l_baseline_31 = plot(N_axis,Draper_r_L);          hold on;
l_baseline_32 = plot(N_axis,Draper_r_L_D_8);      hold on;
set(l_proposed    , 'Color' , wq_r , 'Marker' , '*'); %  red     good
set(l_baseline_1  , 'Color' , wq_b , 'Marker' , 'o'); %  blue    good
set(l_baseline_2  , 'Color' , wq_m , 'Marker' , '+'); %  magenta good
set(l_baseline_31 , 'Color' , wq_p , 'Marker' , '^'); %  purple  good
set(l_baseline_32 , 'Color' , wq_g , 'Marker' , 'd'); %  green  good

line = [l_proposed , l_baseline_1 , l_baseline_2 , l_baseline_31 , l_baseline_32];
set(line , 'LineWidth' , 2.5 , 'MarkerSize' , 16);

fig_legend = legend('\textbf{Proposed Stationary Point $\check{\mathbf{x}}^{\rm (CDF,sp)}$}','\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} (r=L)}','\textbf{Ferdinand \emph{et al.} (r=L/8)}' , 'Interpreter' , 'latex');
set(fig_legend , 'FontSize' , 18);

xlabel('Number of Workers $N$' , 'Interpreter' , 'latex');
ylabel('CDF' ,'Interpreter','latex');
set(gca , 'XLim' , [10,50] , 'XTick' , [10:10:50] , 'FontSize' , 20);
set(gca , 'YLim' , [0,1]   ,                        'FontSize' , 20);

grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);





