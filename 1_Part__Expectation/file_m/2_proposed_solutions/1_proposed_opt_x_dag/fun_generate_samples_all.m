function Y = fun_generate_samples_all(n , mu , M , shift)
buffer_matrix = exprnd(1/mu,[M,n]) + shift;
Y = sort(buffer_matrix,2,'descend');
% Y = Y(:,2:n);
end
