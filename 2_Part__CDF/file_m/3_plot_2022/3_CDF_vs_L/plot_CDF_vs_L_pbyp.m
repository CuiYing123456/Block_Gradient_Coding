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
wq_o  = [1.00,0.41,0.16]; %  orange  good
%% system para (large t)
% L_axis = [2e4, 3e4, 4e4, 5e4, 6e4]; num_points = length(L_axis);
L_axis = [2e4, 2.5e4, 3e4, 3.5e4, 4e4]; num_points = length(L_axis);
N = 20; mu = 10^(-1); t_0 = 1; t = 10 .^ (6.5); M = 50; b = 1; num_sample = 1e5;
%%
iter_Max = 200;
%% approx. solutions
% x_small = [zeros(N_axis-1,1);L]; % red
% x_large = [L;zeros(N_axis-1,1)]; % blue
%% 
L_prop_sta_point  = zeros(num_points,1);
L_prop_approx_lg  = zeros(num_points,1);
L_Single_BCGC     = zeros(num_points,1);
L_Tandon          = zeros(num_points,1);    B2_index = zeros(num_points,1);
L_Draper_r_L      = zeros(num_points,1);
L_Draper_r_L_D_2  = zeros(num_points,1);

% x_small = [zeros(N-1,1);L];
T_mat = exprnd(1/mu,[num_sample,N]) + t_0;
figure(1);
for i = 1:num_points    
    x_large = fun_cal_large_t_solution_nozero(N,L_axis(i));
%     x_get_int = fun_cal_sta_point(t , L_axis(i), M, N, b, mu, t_0 , iter_Max);
%     L_prop_sta_point(i)             = fun_Est_CDF_T(t, x_get_int, T_mat, M, N, b);
    L_prop_approx_lg(i)             = fun_Est_CDF_T(t, x_large, T_mat, M, N, b);
%     [L_Single_BCGC(i),B1_index(i)]  = fun_B1_Single_BCGC_v3(t, L_axis(i), T_mat, M, N, b);
%     [L_Tandon(i),B2_index(i)]       = fun_B2_Tandon_v3(t, L_axis(i), T_mat, M, N, b);
%     L_Draper_r_L(i)                 = fun_B3_Draper_v3(t, L_axis(i), T_mat, M, N, b, 1);
%     L_Draper_r_L_D_2(i)             = fun_B3_Draper_v3(t, L_axis(i), T_mat, M, N, b, 2);
    
    %% Plot point by point
    line_L_prop_sta_point = plot(L_axis(i),L_prop_sta_point(i));     hold on;
    line_L_prop_approx_lg = plot(L_axis(i),L_prop_approx_lg(i));     hold on;
    line_L_Single_BCGC    = plot(L_axis(i),L_Single_BCGC(i));        hold on;
    line_L_Tandon         = plot(L_axis(i),L_Tandon(i));             hold on;
    line_L_Draper_r_L     = plot(L_axis(i),L_Draper_r_L(i));         hold on;
    line_L_Draper_r_L_D_2 = plot(L_axis(i),L_Draper_r_L_D_2(i));     hold on;

    set(line_L_prop_sta_point , 'Color' , wq_b , 'Marker' , 'o'); %  red     good
    set(line_L_prop_approx_lg , 'Color' , wq_m , 'Marker' , 'v'); %  red     good
    set(line_L_Single_BCGC    , 'Color' , wq_o , 'Marker' , 's'); %  blue    good
    set(line_L_Tandon         , 'Color' , wq_p , 'Marker' , 'd'); %  magenta good
    set(line_L_Draper_r_L     , 'Color' , wq_g , 'Marker' , '+'); %  purple  good
    set(line_L_Draper_r_L_D_2 , 'Color' , wq_bl, 'Marker' , '>'); %  green   good

    line_L = [line_L_prop_sta_point , ...
        line_L_prop_approx_lg , ...
        line_L_Single_BCGC , line_L_Tandon , line_L_Draper_r_L , line_L_Draper_r_L_D_2];
    set(line_L , 'LineWidth' , 2.5 , 'MarkerSize' , 16);

    legend_L = legend(...
        '\textbf{Proposed Stationary Point $\check{\mathbf{x}}^{\rm (CDF,sp)}$}' , ...
        '\textbf{Proposed Approximate Solution $\check{\mathbf{x}}^{\rm (CDF,lg)}$}' , ...
        '\textbf{Single BCGC}','\textbf{Tandon \emph{et al.}}','\textbf{Ferdinand \emph{et al.} (r=L)}' , ...
        '\textbf{Ferdinand \emph{et al.} (r=L/2)}' , 'Interpreter' , 'latex');
    set(legend_L , 'FontSize' , 18);

    xlabel('Number of model parameters $L$' , 'Interpreter' , 'latex');
    ylabel('CDF' ,'Interpreter','latex');
    % title('Large $t$ scenario', 'Interpreter' , 'latex');
    set(gca , 'XLim' , [2e4, 4e4] , 'XTick' , [2e4, 2.5e4, 3e4, 3.5e4, 4e4] , 'FontSize' , 20);
    % set(gca , 'XLim' , [10^(7.75),10^(8.50)] , 'FontSize' , 20);
    % set(gca , 'XTickLabel' , {'10^{6.4}','10^{6.45}','10^{6.5}','10^{6.55}','10^{6.6}','10^{6.65}','10^{6.7}'});
    set(gca , 'YLim' , [0,1]   ,                        'FontSize' , 20);

    grid on;
    set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);
    end
