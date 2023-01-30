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
% N = 20; L = [1e4 2e4 3e4 4e4 5e4]; mu = 1e-3; t_0 = 50;
% M = 1e4; iter_Max = 150;
% M_system = 50; b_system = 1;
%% X axis
L_axis = [1e4 2e4 3e4 4e4 5e4];
%% X axis      =[1e4            2e4             3e4             4e4              5e4      ];
% Proposed Solutions
prop_continuous=[1.41           2.86            4.41            6.01             7.61]*1e7;
prop_integer   =[1.41           2.86            4.41            6.01             7.61]*1e7;
% Proposed Heuristic Solution
prop_E_V       =[1.57           3.12            4.70            6.25             7.84]*1e7;

prop_E_T       =[1.58           3.17            4.74            6.33             7.87]*1e7;

% Baseline 1
one_layer      =[2.01           4.01            5.98            8.04             10.1]*1e7;
% Baseline 2
% uniform_layer 
% Baseline 3: [Tandon]
Tandon         =[2.80           5.62            8.40            11.2             14.0]*1e7;
% Baseline 4: [Draper]

Draper_r_L_D_2 =[2.20           5.35            8.04            10.6             13.7]*1e7;

% Draper_r_L_D_4 =[3.28/10        3.96/20           5.46/30           8.78/40           7.02/50]*1e7;

% Draper_r_L_D_8 =[5.86/10        5.05/20           9.48/30           7.26/40           12.5/50]*1e7;

Draper_r_L     =[2.00           4.00            5.99            8.00             9.91]*1e7;

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

% P1  = plot(L_axis,prop_continuous);     hold on;
P1  = plot(L_axis,prop_integer);        hold on;
P2  = plot(L_axis,prop_E_V);            hold on;
P3  = plot(L_axis,prop_E_T);            hold on;
P4  = plot(L_axis,one_layer);           hold on;
% P4  = plot(N_axis,uniform_layer);       hold on;
P5  = plot(L_axis,Tandon);              hold on;
P6  = plot(L_axis,Draper_r_L);          hold on;
P7  = plot(L_axis,Draper_r_L_D_2,'--');      hold on;


% set(P1 , 'Color' , wq_r , 'Marker' , '*');  %  red     good
set(P1 , 'Color' , wq_b , 'Marker' , '*');  %  blue    good
set(P2 , 'Color' , wq_m , 'Marker' , 'o');  %  magenta good
% set(P4 , 'Color' , wq_g , 'Marker' , 'd'); %  green   good
set(P3 , 'Color' , wq_blue , 'Marker' , '+');  %  purple  good
set(P4 , 'Color' , wq_o, 'Marker' , 's');  %  black   good
set(P5 , 'Color' , wq_p , 'Marker' , 'd');  %  green   good
set(P6 , 'Color' , wq_g, 'Marker' , '^');  %  blue 2  good
set(P7 , 'Color' , wq_g  , 'Marker' , '^');  %  orange  good

line = [P1 , P2 , P3 , P4 , P5 , P6 , P7];
set(line , 'LineWidth' , 2.5 , 'MarkerSize' , 16);

legend = legend('\textbf{Proposed Optimal Solution $\check{\mathbf{x}}^{\rm (E,opt)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (E,t)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (E,f)}$}',...
    '\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} ($r=L$)}',...
    '\textbf{Ferdinand \emph{et al.} ($r=L/2$)}','Interpreter' , 'latex');
set(legend , 'FontSize' , 18);

xlabel('Number of Model Parameters $L$' , 'Interpreter' , 'latex');
ylabel('Expected Total Runtime' ,'Interpreter','latex');
set(gca , 'XLim' , [1e4,5e4]          , 'XTick' , [1e4:1e4:5e4] ,   'FontSize' , 20);
set(gca , 'YLim' , [1.0*1e7 * M_system * b_system,14*1e7 * M_system * b_system]   ,                             'FontSize' , 20);


grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);




