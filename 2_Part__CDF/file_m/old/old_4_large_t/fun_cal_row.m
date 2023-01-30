%%
% function: calculate column of x_for_comp
% INPUT
% * subset_cell: 1 x (N-1) cell
% * N:           # of workers
% OUTPUT
% * num_row:    

function num_col = fun_cal_row(subset_cell, N)

if mod(N-1,2) == 0
    num_col = size(subset_cell{(N-1)/2},1);
else
    num_col = size(subset_cell{N/2-1},1);
end