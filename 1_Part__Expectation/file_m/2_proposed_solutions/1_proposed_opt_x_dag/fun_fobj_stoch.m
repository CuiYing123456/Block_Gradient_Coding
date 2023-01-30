%% generate fobj_stoch (neglect expectation & max)
% input:    
%   (column vector)   x -> N * 1
%   (row vector)      t -> 1 * N     or     M * N 
% output:   
%   (row vector)      y -> 1 * N     or     M * N

function y = fun_fobj_stoch(x,t)
  N = length(x);
  buffer_vector_1 = [1:N] .* x';
  sum_vector = buffer_vector_1;
  for i = 1:N-1
      buffer_vector_2 = circshift(buffer_vector_1,[0,i]);
      buffer_vector_2(1:i) = 0;
      sum_vector = sum_vector + buffer_vector_2;
  end
  y = sum_vector .* t;
end
