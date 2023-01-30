clc; 
clear all;
%% System Parameters
% N: # of workers; L: length of gradient ; mu: exp distribution parameter
% M: # of samples used in each iteration
global N L mu t_0 M iter_Max alpha_we_use;
% N = 20; L = 5e4; mu = 10^(-3); t_0 = 50;
% M = 1e4; iter_Max = 500;
% ================================
N = 50; L = 5750; mu = 5*10^(-2); t_0 = 0;
M = 1e4; iter_Max = 300; alpha_we_use = 0;
% ================================

% alpha_we_use = 2;

new_solution_E_inverse;

new_solution_Jensen;

E_B1_single_layer;

E_B2_Tandon;

clear alpha_we_use;
global alpha_we_use;
alpha_we_use = 2;
E_B3_Draper;

clear alpha_we_use;
global alpha_we_use;
alpha_we_use = 1;
E_B3_Draper;

% Finish Music
load handel
sound(y,Fs)