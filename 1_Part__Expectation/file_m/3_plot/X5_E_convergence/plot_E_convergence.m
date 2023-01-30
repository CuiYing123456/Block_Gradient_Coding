clc; clear;
%% -----------------------------------------------------------------------
% DESCRIPTIVE TEXT
% X axis:  # of iterations R
% Y axis:  Expected Total Runtime \tau_avg
% ------------------------------------------------------------------------
% Colors for Plot by wq ==================
wq_r  = [0.85,0.33,0.10]; %  red     good
wq_b  = [0.07,0.62,1.00]; %  blue    good
wq_m  = [1.00,0.00,1.00]; %  magenta good
wq_g  = [0.47,0.67,0.19]; %  green   good
wq_p  = [0.49,0.18,0.56]; %  purple  good
wq_y  = [0.93,0.69,0.10]; %  yellow  good
%% System Parameter-------------------------------------------------------
% N = 30; R = [1e4 , 2e4 , 3e4]; mu = 1e-3; shift = 100;
% M = 1e4; iter_Max = 150;
iter_Max = 50;
%% X axis
iter_axis = 1:iter_Max;
%% Y axis
load('L_1e4.mat');
L_1e4 = obj_memory;
load('L_2e4.mat');
L_2e4 = obj_memory;
load('L_3e4.mat');
L_3e4 = obj_memory;

% load('S_10_3.mat');
% L_1e4 = obj_memory;
% load('S_10_4.mat');
% L_2e4 = obj_memory;
% load('S_10_5.mat');
% L_3e4 = obj_memory;

P1  = plot(iter_axis,L_1e4(1:iter_Max));     hold on;
P2  = plot(iter_axis,L_2e4(1:iter_Max));     hold on;
P3  = plot(iter_axis,L_3e4(1:iter_Max));     hold on;

set(P1 , 'Color' , wq_r , 'Marker' , '*'); %  red     good
set(P2 , 'Color' , wq_b , 'Marker' , 'o'); %  blue    good
set(P3 , 'Color' , wq_m , 'Marker' , '+'); %  magenta good

% set(P1 , 'Color' , wq_r); %  red     good
% set(P2 , 'Color' , wq_b); %  blue    good
% set(P3 , 'Color' , wq_m); %  magenta good

line = [P1 , P2 , P3];
set(line , 'LineWidth' , 2 , 'MarkerSize' , 14);

legend = legend('L=10^3','L=10^4','L=10^5');
set(legend , 'FontSize' , 18);

xlabel('Number of Iterations $K$' , 'Interpreter' , 'latex');
ylabel('Expected Total Runtime' ,'Interpreter','latex');
% set(gca , 'FontSize' , 14);
set(gca , 'XLim' , [1,iter_Max]          , 'FontSize' , 20);
% set(gca , 'YLim' , [3*1e7,14*1e7]   ,                        'FontSize' , 20);
set(gca , 'YLim' , [0*1e7,14*1e7]  , 'FontSize' , 20);


grid on;
set(gcf,'Position',[170/0.277 70/0.277 200/0.277 170/0.277]);
