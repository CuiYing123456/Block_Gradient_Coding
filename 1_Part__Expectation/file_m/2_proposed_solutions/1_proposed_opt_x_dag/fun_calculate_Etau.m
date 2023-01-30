function output = fun_calculate_Etau(x_solution,Sample_matrix)
buffer_matrix = fun_fobj_stoch(x_solution,Sample_matrix);
[obj_vector,~] = max(buffer_matrix,[],2);
M = size(Sample_matrix,1);
output = sum(obj_vector) / M;
end
