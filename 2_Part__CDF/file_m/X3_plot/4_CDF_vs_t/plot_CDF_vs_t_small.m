%% 
% proposed approx. solution: large t & small t
% baselines: B1, B2, B3, B4 
%%
clc; clear all; clf;
%% Colors for Plot by wq =========================
wq_b  = [0.07,0.62,1.00]; %  blue    good
wq_m  = [1.00,0.00,1.00]; %  magenta good
wq_b2 = [0.00,0.00,1.00]; %  blue2   good
wq_y  = [0.93,0.69,0.10]; %  yellow  good
wq_p  = [0.49,0.18,0.56]; %  purple  good
wq_g  = [0.47,0.67,0.19]; %  green   good
wq_bl = [0.00,0.00,0.00]; %  black   good
wq_r  = [0.85,0.33,0.10]; %  red     good
%% system para (small t)
t_axis = 10 .^ [2:0.05:3]; t_0 = 0; num_points = length(t_axis);
N = 6; L = 2e4; mu = 10^(-3); M = 50; b = 1; num_sample = 1e7;
%% approx. solutions
% x_small = [zeros(N_axis-1,1);L]; % red
% x_large = [L;zeros(N_axis-1,1)]; % blue
%% 
% L_prop_integer    = [0      0       0       0      0      0      0      0      0];
L_prop_integer    = zeros(num_points,1);
L_prop_approx_s   = zeros(num_points,1);
L_prop_approx_l   = zeros(num_points,1);
L_Single_BCGC     = zeros(num_points,1);
L_Tandon          = zeros(num_points,1);    B2_index = zeros(num_points,1);
L_Draper_r_L      = zeros(num_points,1);
L_Draper_r_L_D_8  = zeros(num_points,1);

x_small = [zeros(N-1,1);L];
x_large = fun_cal_large_t_solution_nozero(N,L);
T_mat = exprnd(1/mu,[num_sample,N]) + t_0;

for i = 1:num_points
    L_prop_approx_s(i)              = fun_Est_CDF_T(t_axis(i), x_small, T_mat, M, N, b);
    L_prop_approx_l(i)              = fun_Est_CDF_T(t_axis(i), x_large, T_mat, M, N, b);
    [L_Single_BCGC(i),B1_index(i)]  = fun_B1_Single_BCGC_v3(t_axis(i), L, T_mat, M, N, b);
    [L_Tandon(i),B2_index(i)]       = fun_B2_Tandon_v3(t_axis(i), L, T_mat, M, N, b);
%     L_Draper_r_L(i)                 = fun_B3_Draper_v2(N_axis(i), t, L, mu, t_0, M, b, num_sample, 1);
%     L_Draper_r_L_D_8(i)             = fun_B3_Draper_v2(N_axis(i), t, L, mu, t_0, M, b, num_sample, 8);
end
%% calculate proposed integer
% N axis      = [10         20          30          40          50   ]
% L_prop_integer  = [0.038      0.854       0.996       0.9998      1.000]; 
%%
figure(1);
line_L_prop_sp        = semilogx(t_axis,L_prop_integer);      hold on;
line_L_prop_approx_sm = semilogx(t_axis,L_prop_approx_s);     hold on;
line_L_prop_approx_lg = semilogx(t_axis,L_prop_approx_l);     hold on;

line_L_baseline_1     = semilogx(t_axis,L_Single_BCGC);        hold on;
line_L_baseline_2     = semilogx(t_axis,L_Tandon);             hold on;
line_L_baseline_31    = semilogx(t_axis,L_Draper_r_L);         hold on;
line_L_baseline_32    = semilogx(t_axis,L_Draper_r_L_D_8);     hold on;

set(line_L_prop_sp        , 'Color' , wq_b , 'Marker' , 'o'); %  red     good
set(line_L_prop_approx_sm , 'Color' , wq_m , 'Marker' , '^'); %  red     good
set(line_L_prop_approx_lg , 'Color' , wq_b2, 'Marker' , 'v'); %  red     good
set(line_L_baseline_1     , 'Color' , wq_y , 'Marker' , 's'); %  blue    good
set(line_L_baseline_2     , 'Color' , wq_p , 'Marker' , 'd'); %  magenta good
set(line_L_baseline_31    , 'Color' , wq_g , 'Marker' , '+'); %  purple  good
set(line_L_baseline_32    , 'Color' , wq_bl, 'Marker' , '>'); %  green   good


% line_L = [line_L_prop_approx_sm , line_L_prop_approx_lg , ...
%     line_L_baseline_1 , line_L_baseline_2 , line_L_baseline_31 , line_L_baseline_32];
line_L = [line_L_prop_sp, line_L_prop_approx_sm , line_L_prop_approx_lg , ...
    line_L_baseline_1 , line_L_baseline_2 , line_L_baseline_31 , line_L_baseline_32];

set(line_L , 'LineWidth' , 2.5 , 'MarkerSize' , 16);

legend_L = legend(...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,s)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,l)}$}',...
    '\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} (r=L)}','\textbf{Ferdinand \emph{et al.} (r=L/8)}' , 'Interpreter' , 'latex');
legend_L = legend(...
    '\textbf{Proposed Stationary Point $\check{\mathbf{x}}^{\rm (CDF,sp)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,s)}$}',...
    '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,l)}$}',...
    '\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} (r=L)}','\textbf{Ferdinand \emph{et al.} (r=L/8)}' , 'Interpreter' , 'latex');

set(legend_L , 'FontSize' , 18);

%% large t
% xlabel('Time Threshold $t$' , 'Interpreter' , 'latex');
% ylabel('CDF' ,'Interpreter','latex');
% % title('Large $t$ scenario', 'Interpreter' , 'latex');
% % set(gca , 'XLim' , [10^(7.75),10^(8.50)] , 'XTick' , 10.^[7.75:0.05:8.50] , 'FontSize' , 20);
% set(gca , 'XLim' , [10^(7.75),10^(8.50)] , 'FontSize' , 20);
% % set(gca , 'XTickLabel' , {'10^{7.0}','10^{7.25}','10^{7.5}','10^{7.75}','10^{8.0}','10^{8.25}','10^{8.5}','10^{8.75}','10^{9.0}'});
% set(gca , 'YLim' , [0,1]   ,                        'FontSize' , 20);
%% small t
xlabel('Time Threshold $t$' , 'Interpreter' , 'latex');
ylabel('CDF' ,'Interpreter','latex');
% title('Large $t$ scenario', 'Interpreter' , 'latex');
% set(gca , 'XLim' , [10^(7.75),10^(8.50)] , 'XTick' , 10.^[7.75:0.05:8.50] , 'FontSize' , 20);
% set(gca , 'XLim' , [10^(2),10^(3)] , 'FontSize' , 20);
% set(gca , 'XTickLabel' , {'10^{7.0}','10^{7.25}','10^{7.5}','10^{7.75}','10^{8.0}','10^{8.25}','10^{8.5}','10^{8.75}','10^{9.0}'});
% set(gca , 'YLim' , [0,1]   ,                        'FontSize' , 20);

grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);
% %% -------------------------------------
% figure(2);
% log_line_L_prop_approx_sm = semilogy(N_axis,1-L_prop_approx_sm);     hold on;
% log_line_L_prop_approx_lg = semilogy(N_axis,1-L_prop_approx_lg);     hold on;
% 
% % line_L_prop_sp        = plot(N_axis,L_prop_sp);            hold on;
% log_line_L_baseline_1     = semilogy(N_axis,1-L_Single_BCGC);        hold on;
% log_line_L_baseline_2     = semilogy(N_axis,1-L_Tandon);             hold on;
% log_line_L_baseline_31    = semilogy(N_axis,1-L_Draper_r_L);         hold on;
% log_line_L_baseline_32    = semilogy(N_axis,1-L_Draper_r_L_D_8);     hold on;
% 
% % set(line_L_prop_sp        , 'Color' , wq_b , 'Marker' , 'o'); %  red     good
% set(log_line_L_prop_approx_sm , 'Color' , wq_m , 'Marker' , '^'); %  red     good
% set(log_line_L_prop_approx_lg , 'Color' , wq_b2, 'Marker' , 'v'); %  red     good
% set(log_line_L_baseline_1     , 'Color' , wq_y , 'Marker' , 's'); %  blue    good
% set(log_line_L_baseline_2     , 'Color' , wq_p , 'Marker' , 'd'); %  magenta good
% set(log_line_L_baseline_31    , 'Color' , wq_g , 'Marker' , '+'); %  purple  good
% set(log_line_L_baseline_32    , 'Color' , wq_bl, 'Marker' , '>'); %  green   good
% 
% log_line_L = [log_line_L_prop_approx_sm , log_line_L_prop_approx_lg , ...
%     log_line_L_baseline_1 , log_line_L_baseline_2 , log_line_L_baseline_31 , log_line_L_baseline_32];
% set(log_line_L , 'LineWidth' , 2.5 , 'MarkerSize' , 16);
% 
% log_legend_L = legend(...
%     '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,s)}$}',...
%     '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,l)}$}',...
%     '\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} (r=L)}','\textbf{Ferdinand \emph{et al.} (r=L/8)}' , 'Interpreter' , 'latex');
% set(log_legend_L , 'FontSize' , 18);
% 
% xlabel('Number of Workers $N$' , 'Interpreter' , 'latex');
% ylabel('Failure Probability','Interpreter','latex');
% % title('Large $t$ scenario', 'Interpreter' , 'latex');
% title('Small $t$ scenario', 'Interpreter' , 'latex');
% set(gca , 'XLim' , [10,50] , 'XTick' , [10:10:50] , 'FontSize' , 20);
% set(gca , 'YLim' , [0,1]   ,                        'FontSize' , 20);
% 
% grid on;
% set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);


