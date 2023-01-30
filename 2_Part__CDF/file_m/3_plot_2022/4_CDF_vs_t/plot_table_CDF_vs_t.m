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
wq_bl = [0.00,0.00,0.00]; %  black   good
wq_o  = [1.00,0.41,0.16]; %  orange  good
%% System Parameter-------------------------------------------------------
% t = 10 .^ [7.0 7.5 8.0 8.25 8.5 9.0]; 
% N = 20;   L = 2e4;   mu = 1e-3;   t_0 = 1;
% M =  50;    b =    1;
% iter_Max = 200;    num_sample = 1e4;    batchsize = 3e2;    tausize = 1e2;
%% X axis
t_axis = 10 .^ [6.50:0.05:6.70];
%% X axis           = [10^(6.50)      10^(6.55)      10^(6.60)      10^(6.65)      10^(6.70)  ];
% Proposed Solution
prop_sta_point      = [0.910          0.942          0.969          0.989          0.996      ];
prop_approx_lg      = [0.760          0.866          0.943          0.982          0.996      ];
% Baseline 1 - single BCGC
Single_BCGC         = [0.686          0.786          0.861          0.915          0.950      ];
% Baseline 2: [Tandon, partial straggler]
Tandon              = [0.692          0.806          0.890          0.943          0.974      ];
% Baseline 3: [Draper]
Draper_r_L          = [0.686          0.786          0.861          0.915          0.950      ];

Draper_r_L_D_2      = [0.525          0.651          0.759          0.843          0.904      ];

L_prop_sta_point = semilogx(t_axis,prop_sta_point);        hold on;
L_prop_approx_lg = semilogx(t_axis,prop_approx_lg);        hold on;
L_Single_BCGC    = semilogx(t_axis,Single_BCGC);           hold on;
L_Tandon         = semilogx(t_axis,Tandon);                hold on;
L_Draper_r_L     = semilogx(t_axis,Draper_r_L);            hold on;
L_Draper_r_L_D_2 = semilogx(t_axis,Draper_r_L_D_2,'--');        hold on;

set(L_prop_sta_point , 'Color' , wq_b , 'Marker' , '*'); %  red     good
set(L_prop_approx_lg , 'Color' , wq_m , 'Marker' , 'o'); %  yellow  good
set(L_Single_BCGC    , 'Color' , wq_o , 'Marker' , 's'); %  blue    good
set(L_Tandon         , 'Color' , wq_p , 'Marker' , 'd'); %  magenta good
set(L_Draper_r_L     , 'Color' , wq_g , 'Marker' , '^'); %  purple  good
set(L_Draper_r_L_D_2 , 'Color' , wq_g , 'Marker' , '^'); %  green   goo

line = [L_prop_sta_point , L_prop_approx_lg , L_Single_BCGC , L_Tandon , L_Draper_r_L , L_Draper_r_L_D_2];
set(line , 'LineWidth' , 2.5 , 'MarkerSize' , 16);
grid on;

xlabel('Threshold  $t$' , 'Interpreter' , 'latex');
ylabel('Completion Probability' ,'Interpreter' , 'latex');
set(gca , 'XLim' , [10^(6.5),10^(6.7)] , 'XTick' , 10.^[6.50 6.55 6.60 6.65 6.70] ,  'FontSize' , 20);
set(gca , 'XTickLabel' , {'10^{6.5}','10^{6.55}','10^{6.6}','10^{6.65}','10^{6.7}'});
set(gca , 'YLim' , [0.5,1]   ,                       'FontSize' , 20);
% set(gca , 'YTickLabel' , {'10^{7.6}','10^{8}','10^{8.4}','10^{8.8}'});
%%
% fig_legend_1 = legend( line(1:2), '\textbf{Proposed Stationary Point $\check{\mathbf{x}}^{\rm (CDF, st)}$}' ,...
%     '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,lg)}$}' , 'Interpreter' , 'latex');
% set(gca,'FontSize',18);
% ah_1 = axes('position',get(gca,'position'),'visible','off');
% 
% fig_legend_2 = legend( ah_1 , line(3:6) , '\textbf{Single BCGC}','\textbf{Tandon \emph{et al}.}',...
%     '\textbf{Ferdinand \emph{et al.} ($r=L$)}','\textbf{Ferdinand \emph{et al.} ($r=L/2$)}' , 'Interpreter' , 'latex');
% set(gca,'FontSize',18);
% ah_2 = axes('position',get(gca,'position'),'visible','off');
% 
% % grid on;
% set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);

%%
fig_legend = legend('\textbf{Proposed Stationary Point $\check{\mathbf{x}}^{\rm (CDF,st)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,lg)}$}',...
    '\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} ($r=L$)}',...
    '\textbf{Ferdinand \emph{et al.} ($r=L/2$)}' , 'Interpreter' , 'latex');
set(fig_legend , 'FontSize' , 18);

grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);