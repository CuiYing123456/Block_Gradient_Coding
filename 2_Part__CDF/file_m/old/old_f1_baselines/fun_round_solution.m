%%
% function: round the continuous solution x
% INPUT
% * x_vec: continuous solution
% * SUM:   sum(x_vec) should be SUM
% OUTPUT
% * y_vec: integer solution
% 

function y_vec = fun_round_solution(x_vec,SUM)
% ---------------------------------------------------------
% if x_vec = SUM 
%     y_vec = x_vec;
% elseif x_vec < SUM
%     [~,index] = max(x_vec);
%     x_vec(index) = x_vec(index) + (SUM - sum(x_vec));
%     y_vec = x_vec; 
% elseif x_vec > SUM
%     [~,index] = max(x_vec);
%     x_vec(index) = x_vec(index) - (sum(x_vec) - SUM);
%     y_vec = x_vec;
% end
% --------------------------------------------------------- 
x_vec = round(x_vec);
if x_vec == SUM 
    y_vec = x_vec;
else
    [~,index] = max(x_vec);
    x_vec(index) = x_vec(index) + (SUM - sum(x_vec));
    y_vec = x_vec; 
end
% --------------------------------------------------------- 
if all(y_vec(:) >= 0)
    display('Rounding Completed!')
else
    display('Rounding Failed!')
end