clc; clear;
%% -----------------------------------------------------------------------
% DESCRIPTIVE TEXT
% X axis:  Number of Users N
% Y axis:  Expected Total Runtime \tau_avg
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
wq_black = [0.00,0.00,0.00]; %  black  good
%% System Parameter-------------------------------------------------------
% N = 20; L = 2e4; mu = [1e-3.4 1e-3.2 1e-3.0 1e-2.8 1e-2.6]; t_0 = 50;
% M = 1e4; iter_Max = 150;
% M_system = 50; b_system = 1;
%% X axis
mu_axis = 10.^[-3.4:0.2:-2.6];
%% X axis      =[1e-3.4            1e-3.2               1e-3.0               1e-2.8               1e-2.6     ];
prop_continuous=[5.90              4.09                 2.88                 2.08                 1.56       ]*1e7;
prop_integer   =[5.90              4.09                 2.88                 2.08                 1.56       ]*1e7;
% Proposed Heuristic Solution
prop_E_V       =[6.49              4.47                 3.14                 2.22                 1.58       ]*1e7;

prop_E_T       =[6.78              4.56                 3.16                 2.22                 1.58       ]*1e7;

% Baseline 1
one_layer      =[6.98              5.15                 3.99                 3.25                 2.80       ]*1e7;
% Baseline 2
% uniform_layer 
% Baseline 3: [Tandon]
Tandon         =[13.9              8.89                 5.62                 3.57                 2.32       ]*1e7;
% Baseline 4: [Draper]

Draper_r_L_D_2 =[10.7              7.45                 5.30                 4.03                 3.19       ]*1e7;

% Draper_r_L_D_4 =[3.28/10           3.96/20              5.46/30              8.78/40              7.02/50]*1e7;

% Draper_r_L_D_8 =[5.86/10           5.05/20              9.48/30              7.26/40              12.5/50]*1e7;

Draper_r_L     =[6.99              5.22                 4.00                 3.25                 2.81       ]*1e7;

% ------------
M_system = 50; b_system = 1;
prop_integer   = prop_integer   * M_system * b_system;
prop_E_T       = prop_E_T       * M_system * b_system;
prop_E_V       = prop_E_V       * M_system * b_system;
one_layer      = one_layer      * M_system * b_system;
Tandon         = Tandon         * M_system * b_system;
Draper_r_L     = Draper_r_L     * M_system * b_system;
Draper_r_L_D_2 = Draper_r_L_D_2 * M_system * b_system;
% ------------


% P1  = loglog(mu_axis,prop_continuous);     hold on;
P2  = loglog(mu_axis,prop_integer);        hold on;
P3  = loglog(mu_axis,prop_E_T);            hold on;
P5  = loglog(mu_axis,prop_E_V);            hold on;
P6  = loglog(mu_axis,one_layer);           hold on;
% P4  = plot(N_axis,uniform_layer);       hold on;
P7  = loglog(mu_axis,Tandon);              hold on;
P8  = loglog(mu_axis,Draper_r_L);          hold on;
P9  = loglog(mu_axis,Draper_r_L_D_2,'--');      hold on;


% set(P1 , 'Color' , wq_r , 'Marker' , '*');  %  red     good
set(P2 , 'Color' , wq_b , 'Marker' , '*');  %  blue    good
set(P3 , 'Color' , wq_m , 'Marker' , 'o');  %  magenta good
% set(P4 , 'Color' , wq_g , 'Marker' , 'd'); %  green   good
set(P5 , 'Color' , wq_blue , 'Marker' , '+');  %  purple  good
set(P6 , 'Color' , wq_o, 'Marker' , 's');  %  black   good
set(P7 , 'Color' , wq_p , 'Marker' , 'd');  %  green   good
set(P8 , 'Color' , wq_g, 'Marker' , '^');  %  blue 2  good
set(P9 , 'Color' , wq_g , 'Marker' , '^');  %  orange  good

line = [P2 , P3 , P5 , P6 , P7 , P8 , P9];
set(line , 'LineWidth' , 2.5 , 'MarkerSize' , 16);

% legend = legend('Proposed Suboptimal Solution','Continuous Relaxation Solution','Single BCGC','Tandon {\itet al}',...
%     'Ferdinand {\itet al} (r=L)','Ferdinand {\itet al} (r=L/2)',...
%     'Proposed Approximate Solution 1','Proposed Approximate Solution 2');
legend = legend('\textbf{Proposed Optimal Solution $\check{\mathbf{x}}^{\rm (E,opt)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (E,t)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (E,f)}$}',...
    '\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} ($r=L$)}',...
    '\textbf{Ferdinand \emph{et al.} ($r=L/2$)}','Interpreter' , 'latex');
set(legend , 'FontSize' , 18);

xlabel('Rate Parameter $\mu$' , 'Interpreter' , 'latex');
ylabel('Expected Total Runtime' ,'Interpreter','latex');
% set(gca , 'XLim' , [10,50]          , 'XTick' , [10:10:50] , 'FontSize' , 20);
% set(gca , 'YLim' , [0.07*1e7,0.3*1e7]   ,                   'FontSize' , 20);
set(gca , 'XLim' , [10^(-3.4),10^(-2.6)] , 'XTick' , 10.^[-3.4:0.2:-2.6] ,  'FontSize' , 20);
set(gca , 'XTickLabel' , {'10^{-3.4}','10^{-3.2}','10^{-3.0}','10^{-2.8}','10^{-2.6}'});
% set(gca , 'YLim' , [1.5*1e7,16*1e7]   ,  'YTick' , 10.^[7.2:0.2:8.2] ,'FontSize' , 20);
% set(gca , 'YTickLabel' , {'10^{7.2}','10^{7.4}','10^{7.6}','10^{7.8}','10^{8.0}','10^{8.2}'});
set(gca , 'YLim' , [1.5*1e7 * M_system * b_system,16*1e7 * M_system * b_system]   ,  'YTick' , 10.^[8.9:0.2:9.9] ,'FontSize' , 20);
set(gca , 'YTickLabel' , {'10^{8.9}','10^{9.1}','10^{9.3}','10^{9.5}','10^{9.7}','10^{9.9}'});

grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);




