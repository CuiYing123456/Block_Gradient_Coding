clear; clc;
%%
% system parameter
N = 5; L = 2e4;
mu = 1e-3; t_0 = 1; M = 50; b = 1; 
t = 10 .^ [7];
%%
% calculate all subsets
subset_cell = fun_allsubsets(N-2); % 1 x (N-1) cell
num_col = fun_cal_row(subset_cell, N);
x_for_comp_cell = cell(N-1,num_col);
%%
% 
for card = 1:N-1
    buffer_matrix = subset_cell{card};
    for row = 1:size(buffer_matrix,1)
        buffer_factor_1 = fun_cal_factor_1(buffer_matrix(row)', N, mu, t_0);
        x_for_comp_cell{card,row} = fun_solve_convex(buffer_matrix(row)', N, L);
    end       
end
f_obj_for_comp = zeros(N-1,num_col);
for card = 1:N-1
    for row = 1:size(buffer_matrix,1)
        f_obj_for_comp(card,row) = fun_cal_fobj(x_for_comp_cell{card,row},    N, L, mu, t_0, M, b, t);
    end
end
[row_solution,col_solution] = find( f_obj_for_comp == min(min(f_obj_for_comp)) );

        
        