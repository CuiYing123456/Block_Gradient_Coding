clc; clear;
%% -----------------------------------------------------------------------
% DESCRIPTIVE TEXT
% X axis:  Number of Users N
% Y axis:  Expected Total Runtime \tau_avg
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
% N = [10 20 30 40 50]; L = 2e4; mu = 1e-3; t_0 = 50;
% M = 1e4; iter_Max = 500;
% M_system = 50; b_system = 1;
%% X axis
N_axis = [10:10:50];
%% X axis      =[10                20                   30                   40                   50     ];
% Proposed Solutions
prop_continuous=[2.41/10           2.87/20              3.30/30              3.68/40              4.03/50]*1e7;
prop_integer   =[2.41/10           2.87/20              3.30/30              3.68/40              4.03/50]*1e7;
% Proposed Heuristic Solution
prop_E_V       =[2.56/10           3.12/20              3.62/30              4.03/40              4.42/50]*1e7;

prop_E_T       =[2.63/10           3.16/20              3.64/30              4.04/40              4.42/50]*1e7;

% Baseline 1
one_layer      =[3.00/10           4.01/20              5.04/30              6.00/40              7.03/50]*1e7;
% Baseline 2
% uniform_layer 
% Baseline 3: [Tandon]
Tandon         =[3.93/10           5.65/20              6.70/30              7.40/40              7.95/50]*1e7;
% Baseline 4: [Draper]

Draper_r_L_D_2 =[2.86/10           5.28/20              6.35/30              5.86/40              6.95/50]*1e7;

% Draper_r_L_D_4 =[3.28/10           3.96/20              5.46/30              8.78/40              7.02/50]*1e7;

% Draper_r_L_D_8 =[5.86/10           5.05/20              9.48/30              7.26/40              12.5/50]*1e7;

Draper_r_L     =[3.00/10           4.03/20              4.99/30              6.02/40              7.02/50]*1e7;

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



% P1  = plot(N_axis,prop_continuous);     hold on;
P2  = plot(N_axis,prop_integer);        hold on;
P3  = plot(N_axis,prop_E_T);            hold on;
P5  = plot(N_axis,prop_E_V);            hold on;
P6  = plot(N_axis,one_layer);           hold on;
% P4  = plot(N_axis,uniform_layer);       hold on;
P7  = plot(N_axis,Tandon);              hold on;
P8  = plot(N_axis,Draper_r_L);          hold on;
P9  = plot(N_axis,Draper_r_L_D_2,'--');      hold on;


% set(P1 , 'Color' , wq_r , 'Marker' , '*');  %  red     good
set(P2 , 'Color' , wq_b , 'Marker' , '*');  %  blue    good
set(P3 , 'Color' , wq_m , 'Marker' , 'o');  %  magenta good
% set(P4 , 'Color' , wq_g , 'Marker' , 'd'); %  green   good
set(P5 , 'Color' , wq_blue , 'Marker' , '+');  %  purple  good
set(P6 , 'Color' , wq_o, 'Marker' , 's');  %  black   good
set(P7 , 'Color' , wq_p , 'Marker' , 'd');  %  green   good
set(P8 , 'Color' , wq_g, 'Marker' , '^');  %  blue 2  good
set(P9 , 'Color' , wq_g , 'Marker' , '^');  %  orange  good

% line = [P1 , P2 , P3 , P5 , P6 , P7 , P8 , P9];
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

xlabel('Number of Users $N$' , 'Interpreter' , 'latex');
ylabel('Expected Total Runtime' ,'Interpreter','latex');
set(gca , 'XLim' , [10,50]          , 'XTick' , [10:10:50] , 'FontSize' , 20);
set(gca , 'YLim' , [0.07*1e7 * M_system * b_system,0.32*1e7 * M_system * b_system]   ,   'FontSize' , 20);
% set(gca , 'YLim' , [0.07*1e7 * M_system * b_system,0.25*1e7 * M_system * b_system]   ,   'FontSize' , 20);


grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);




