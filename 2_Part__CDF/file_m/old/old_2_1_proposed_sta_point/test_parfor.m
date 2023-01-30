% test parfor
clc;clear all;
%% parfor setup
% CoreNum = 6;
% if parpool('size') <= 0
%     parpool('open','local',CoreNum);
% else
%     disp('matlab pool already started');
% end
array = 1:1000000;
sum_array = zeros(10,1);
parfor_processor = 10;
sample_in_each_processor = 100 / 10;
tic;
for j = 1:parfor_processor
    a = array((j-1)*sample_in_each_processor+1 : j*sample_in_each_processor);
    for k = 1:100000000
        sum_array(j) = sum(a);
    end
end
toc;
sum_array
    
% matlabpool close