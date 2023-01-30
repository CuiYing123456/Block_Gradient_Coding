clc; clear;
%% CDF maximization -----------------------------------------------------------------------
% DESCRIPTIVE TEXT
% X axis:  Number of Users N
% Y axis:  CDF
% ------------------------------------------------------------------------
%% Colors for Plot by wq ==================
wq_b  = [0.07,0.62,1.00]; %  blue    good
wq_m  = [1.00,0.00,1.00]; %  magenta good
wq_b2 = [0.00,0.00,1.00]; %  blue2   good
wq_y  = [0.93,0.69,0.10]; %  yellow  good
wq_p  = [0.49,0.18,0.56]; %  purple  good
wq_g  = [0.47,0.67,0.19]; %  green   good
wq_bl = [0.00,0.00,0.00]; %  black   good
wq_r  = [0.85,0.33,0.10]; %  red     good
%% System Parameter-------------------------------------------------------
% N = [10 20 30 40 50]; 
% L = 2e4;   mu = 1e-3;   t = 7e7;   t_0 = 1;
% M =  50;    b =    1;
% iter_Max = 200;    num_sample = 1e4;    batchsize = 3e2;    tausize = 1e2;
%% X axis
N_axis = [10:10:50];
%% fig 1: small t better, with t = 7 * 10^7, t_0 = 1
% X axis              = [10              20                 30               40                 50         ];
% Proposed Solution
S_prop_sp             = [0.522           0.770              0.902            0.958              0.980];
% Proposed Approx_small_t
S_prop_approx_sm      = [0.506           0.753              0.876            0.942              0.971];
% Proposed Approx_large_t
S_prop_approx_lg      = [0.002           0.004              0.021            0.081              0.223];
% Baseline 1 - single BCGC
S_Single_BCGC         = [0.499           0.742              0.872            0.933              0.965];
% Baseline 2: [Tandon, partial straggler]
S_Tandon              = [0.013           0.025              0.081            0.211              0.400];
% Baseline 3: [Draper]
S_Draper_r_L          = [0.507           0.748              0.865            0.935              0.969];

S_Draper_r_L_D_8      = [0.209           0.476              0.653            0.876              0.949];
%% fig 2: large t better, with t = 10^(8.5), t_0 = 300
% X axis              = [10              20                 30               40                 50         ];
% Proposed Solution
L_prop_sp             = [0.           0.              0.            0.              0.];
% Proposed Approx_small_t
L_prop_approx_sm      = [0.149           0.275              0.390            0.471              0.560];
% Proposed Approx_large_t
L_prop_approx_lg      = [0.566           0.956              0.997            0.999              1.000];
% prop_large_con 1 - single BCGC
L_Single_BCGC         = [0.548           0.949              0.996            0.999              0.999];
% Baseline 2: [Tandon, partial straggler]
L_Tandon              = [0.           0.              0.            0.              0.];
% Baseline 3: [Draper]
L_Draper_r_L          = [0.           0.              0.            0.              0.];

L_Draper_r_L_D_8      = [0.           0.              0.            0.              0.];
%% plot fig_1: small t is better than large t
figure(1);

line_S_prop_sp        = plot(N_axis,S_prop_sp);            hold on;
line_S_prop_approx_sm = plot(N_axis,S_prop_approx_sm);     hold on;
line_S_prop_approx_lg = plot(N_axis,S_prop_approx_lg);     hold on;

line_S_baseline_1     = plot(N_axis,S_Single_BCGC);        hold on;
line_S_baseline_2     = plot(N_axis,S_Tandon);             hold on;
line_S_baseline_31    = plot(N_axis,S_Draper_r_L);         hold on;
line_S_baseline_32    = plot(N_axis,S_Draper_r_L_D_8);     hold on;

set(line_S_prop_sp        , 'Color' , wq_b , 'Marker' , 'o'); %  red     good
set(line_S_prop_approx_sm , 'Color' , wq_m , 'Marker' , '^'); %  red     good
set(line_S_prop_approx_lg , 'Color' , wq_b2, 'Marker' , 'v'); %  red     good
set(line_S_baseline_1     , 'Color' , wq_y , 'Marker' , 's'); %  blue    good
set(line_S_baseline_2     , 'Color' , wq_p , 'Marker' , 'd'); %  magenta good
set(line_S_baseline_31    , 'Color' , wq_g , 'Marker' , '+'); %  purple  good
set(line_S_baseline_32    , 'Color' , wq_bl, 'Marker' , '>'); %  green   good

line_S = [line_S_prop_sp , line_S_prop_approx_sm , line_S_prop_approx_lg , ...
    line_S_baseline_1 , line_S_baseline_2 , line_S_baseline_31 , line_S_baseline_32];
set(line_S , 'LineWidth' , 2.5 , 'MarkerSize' , 16);

legend_S = legend('\textbf{Proposed Stationary Point $\check{\mathbf{x}}^{\rm (CDF,sp)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,s)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,l)}$}',...
    '\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} (r=L)}','\textbf{Ferdinand \emph{et al.} (r=L/8)}' , 'Interpreter' , 'latex');
set(legend_S , 'FontSize' , 18);

xlabel('Number of Workers $N$' , 'Interpreter' , 'latex');
ylabel('CDF' ,'Interpreter','latex');
set(gca , 'XLim' , [10,50] , 'XTick' , [10:10:50] , 'FontSize' , 20);
set(gca , 'YLim' , [0,1]   ,                        'FontSize' , 20);

grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);
%% plot fig_1: large t is better than small t
figure(2);

line_L_prop_sp        = plot(N_axis,L_prop_sp);            hold on;
line_L_prop_approx_sm = plot(N_axis,L_prop_approx_sm);     hold on;
line_L_prop_approx_lg = plot(N_axis,L_prop_approx_lg);     hold on;

line_L_baseline_1     = plot(N_axis,L_Single_BCGC);        hold on;
line_L_baseline_2     = plot(N_axis,L_Tandon);             hold on;
line_L_baseline_31    = plot(N_axis,L_Draper_r_L);         hold on;
line_L_baseline_32    = plot(N_axis,L_Draper_r_L_D_8);     hold on;

set(line_L_prop_sp        , 'Color' , wq_b , 'Marker' , 'o'); %  red     good
set(line_L_prop_approx_sm , 'Color' , wq_m , 'Marker' , '^'); %  red     good
set(line_L_prop_approx_lg , 'Color' , wq_b2, 'Marker' , 'v'); %  red     good
set(line_L_baseline_1     , 'Color' , wq_y , 'Marker' , 's'); %  blue    good
set(line_L_baseline_2     , 'Color' , wq_p , 'Marker' , 'd'); %  magenta good
set(line_L_baseline_31    , 'Color' , wq_g , 'Marker' , '+'); %  purple  good
set(line_L_baseline_32    , 'Color' , wq_bl, 'Marker' , '>'); %  green   good

line_L = [line_L_prop_sp , line_L_prop_approx_sm , line_L_prop_approx_lg , ...
    line_L_baseline_1 , line_L_baseline_2 , line_L_baseline_31 , line_L_baseline_32];
set(line_L , 'LineWidth' , 2.5 , 'MarkerSize' , 16);

legend_L = legend('\textbf{Proposed Stationary Point $\check{\mathbf{x}}^{\rm (CDF,sp)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,s)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,l)}$}',...
    '\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} (r=L)}','\textbf{Ferdinand \emph{et al.} (r=L/8)}' , 'Interpreter' , 'latex');
set(legend_L , 'FontSize' , 18);

xlabel('Number of Workers $N$' , 'Interpreter' , 'latex');
ylabel('CDF' ,'Interpreter','latex');
set(gca , 'XLim' , [10,50] , 'XTick' , [10:10:50] , 'FontSize' , 20);
set(gca , 'YLim' , [0,1]   ,                        'FontSize' , 20);

grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);


