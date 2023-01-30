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
wq_bl = [0.00,0.00,0.00]; %  black   good
wq_o  = [1.00,0.41,0.16]; %  orange  good
%% System Parameter-------------------------------------------------------
% N = [10 20 30 40 50]; 
% L = 2e4;   mu = 1e-3;   t = 7e7;   t_0 = 1;
% M =  50;    b =    1;
% iter_Max = 200;    num_sample = 1e4;    batchsize = 3e2;    tausize = 1e2;
%% X axis
L_axis = [2:0.5:4] * 10^4;
%% X axis           = [2e4            2.5e4          3e4            3.5e4          4e4  ];
% Proposed Solution
prop_sta_point      = [1.000          0.998          0.976          0.952          0.910];
prop_approx_lg      = [1.000          0.997          0.967          0.876          0.760];

% Baseline 1 - single BCGC
Single_BCGC         = [0.987          0.954          0.892          0.801          0.687];
% Baseline 2: [Tandon, partial straggler]
Tandon              = [0.997          0.975          0.920          0.823          0.694];
% Baseline 3: [Draper]
Draper_r_L          = [0.988          0.954          0.893          0.801          0.688];

Draper_r_L_D_2      = [0.971          0.879          0.768          0.661          0.526];

L_prop_sta_point  = plot(L_axis,prop_sta_point);      hold on;
L_prop_approx_lg  = plot(L_axis,prop_approx_lg);      hold on;
L_Single_BCGC     = plot(L_axis,Single_BCGC);         hold on;
L_Tandon          = plot(L_axis,Tandon);              hold on;
L_Draper_r_L      = plot(L_axis,Draper_r_L);          hold on;
L_Draper_r_L_D_2  = plot(L_axis,Draper_r_L_D_2,'--');      hold on;

set(L_prop_sta_point , 'Color' , wq_b , 'Marker' , '*'); %  red     good
set(L_prop_approx_lg , 'Color' , wq_m , 'Marker' , 'o'); %  yellow  good
set(L_Single_BCGC    , 'Color' , wq_o , 'Marker' , 's'); %  blue    good
set(L_Tandon         , 'Color' , wq_p , 'Marker' , 'd'); %  magenta good
set(L_Draper_r_L     , 'Color' , wq_g  , 'Marker' , '^'); %  purple  good
set(L_Draper_r_L_D_2 , 'Color' , wq_g , 'Marker' , '^'); %  green   goo

line = [L_prop_sta_point , L_prop_approx_lg , L_Single_BCGC , L_Tandon , L_Draper_r_L , L_Draper_r_L_D_2];
set(line , 'LineWidth' , 2.5 , 'MarkerSize' , 16);

fig_legend = legend('\textbf{Proposed Stationary Point $\check{\mathbf{x}}^{\rm (CDF,st)}$}' , ...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,lg)}$}' , ...
    '\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} ($r=L$)}' , ...
    '\textbf{Ferdinand \emph{et al.} ($r=L/2$)}' , 'Interpreter' , 'latex');
set(fig_legend , 'FontSize' , 18);

xlabel('Number of model parameters $L$' , 'Interpreter' , 'latex');
ylabel('Completion Probability' ,'Interpreter' , 'latex');
set(gca , 'XLim' , [2e4,4e4] , 'XTick' , [2:0.5:4] * 10^4 , 'FontSize' , 20);
set(gca , 'YLim' , [0.5,1]   ,                        'FontSize' , 20);

grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);





