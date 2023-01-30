function x_get_int = fun_cal_sta_point(t, L, M, N, b, mu, t_0 , iter_Max)
%% System Parameter
mutN__Mb = mu * t * N / (M * b);
A = exp(-mutN__Mb); B = exp(mu * t_0);
% I = eye(N); %for extracting unit vector e_i
% buffer_vector = [[1:N-1] .* [2:N] , N]; buffer_vector = buffer_vector';
%%
% iter_Max  = 200;
num_Max   = 1e4;
batchsize = 5e2;
tausize   = 1e2;
%% Solve CSSCA
% stepsize parameter
alpha = 0.6; beta = 0.7;
f_italic_0_i = 0; f_full_0_i = zeros(N,1); f_italic_1_i = 0; f_full_1_i = zeros(N,1);
% tau_0 = 1e-5; tau_1 = 1e-16; 
%% set initial points
% y_init = 2 * pow_p([1:N].*[2:(N+1)] , -1)' * N/L;
% x_init = L/N * ones(N,1);
% x_init = [25;35;45;55;95;105;145;155;165;175];
% x_init = [100;100;100;100;100;100;100;100;100;19100];
% x_init = [100*ones(N-1,1);L-(N-1)*100];
% x_init = [80*ones(N-1,1);L-(N-1)*80];
x_init = fun_cal_large_t_solution_nozero(N,L);
% x_init = fun_large_t_init(N,L);
% x_init = [100*ones(N-2,1);L-(N-2)*100;L-(N-2)*100];
% x_init = [20;20;30;30;40;40;50;50;80;100;120;130;150;150;150;160;160;160;180;180]/2;
% x_init = [10;10;10;10;10;10;10;10;10;910];
% x_init = [ones(N-1,1);L-N-1];
coefficient_matrix = [];
for i = 1:N
    coefficient_matrix = [coefficient_matrix ; [[1:i],zeros(1,N-i)]];
end
y_init = 1 ./ (coefficient_matrix * x_init);
w_init = mutN__Mb * y_init;
u_init = [ log( exp(-w_init(2:N))-exp(-w_init(1:N-1)) ) ; log( 1/B-exp(-w_init(N)) ) ];
w_i = w_init;
u_i = u_init;

iter = 1; 
%% estimate tau_0 and tau_1
vector_tau_0_index = zeros(1,batchsize);
vector_tau_1_index = zeros(1,batchsize);
for i = 1:tausize
    k_i = fun_large_sampling_k(N);
    vector_tau_0_index(i) = floor( log10(abs(min( fun_w_grad_u_g_0(u_i,k_i,N) ))));
    vector_tau_1_index(i) = floor( log10(abs(min( fun_w_grad_w_g_1(w_i,N) ) )) );
end
% tau_0 = 10^( max(vector_tau_0_index) -3);
% tau_1 = 10^max(vector_tau_1_index);
tau_0 = 10^(-5);
tau_1 = 10^(-3);
% while norm([variable_new - variable_old],2) > 1e-10
while iter <= iter_Max
    fprintf(2,['iteration = ', num2str(iter), '\n']);
%     fprintf(2,['difference = ', num2str(norm([variable_new-variable_old],2)), '\n']);
%%  display CDF   
    if mod(iter,10) == 0
        CDF_i = fun_large_ln_estimate_CDF_par(u_i,N,num_Max,B,12);
        fprintf(2,['CDF = ', num2str(CDF_i), '\n']);
        fprintf(2,['t = ', num2str(t), '\n']);
    end
%%
    pho_i = (1/iter)^alpha;
    gamma_i = (1/iter)^beta;
    % Sampling
    batchmatrix_k = zeros(batchsize,N);
    for i = 1:batchsize
        batchmatrix_k(i,:) = fun_large_sampling_k(N);
    end
    % use CVX to solve i-th iteration of CSSCA   
    % solve a convex approximation problem
    cvx_begin
    cvx_solver mosek
        variables u(N) w(N) epi
%         minimize( fun_w_bar_f_0i( w , u , w_i , u_i , k_i , f_italic_0_i , f_full_0_i , N , pho_i ...
%             , tau_0 )  )
%       minimize( -log( -fun_w_bar_f_0i( w , u , w_i , u_i , k_i , f_italic_0_i , f_full_0_i , N , pho_i...
%             , tau_0 ) ) )
%         minimize( fun_Card(0,N) * fun_w_bar_f_0i( w , u , w_i , u_i , k_i , f_italic_0_i , f_full_0_i , N , pho_i ...
%             , tau_0 )  )
        fobj = 0;
        for i = 1:batchsize
            fobj = fobj + fun_w_bar_f_0i( u , w , u_i , w_i , batchmatrix_k(i,:)' , f_italic_0_i , f_full_0_i , N , pho_i , tau_0 );
        end
        fobj = fobj / batchsize;
        minimize( epi*1e7 )
        subject to
            fun_w_bar_f_1i( u , w , u_i , w_i , f_italic_1_i , f_full_1_i , N , L , pho_i , tau_1 ,...
                mutN__Mb ) *1e6 <= 1e-6 *1e6;
            sum( pow_p( [[1:N-1].*[2:N],N]' .* w , -1) ) *1e6 <= (L / mutN__Mb + 1e-3) *1e6;
            w >= 1e-20 * ones(N,1);
%             u >= -1e50 * ones(N,1);
            exp( u(1:N-1) + w(2:N) ) *1e6 + exp( -w(1:N-1) + w(2:N) ) *1e6 <= ones(N-1,1) *1e6;
            exp( u(N) ) *1e6 + exp( -w(N) ) *1e6 <= 1/B *1e6;        
%             log ( exp( u(1:N-1) + w(2:N)) + exp( -w(1:N-1) + w(2:N) ) ) <= 0 * ones(N-1,1);
%             log( exp( u(N) ) + exp( -w(N) ) ) <= log(1/B);
            fobj <= epi;
    cvx_end
    %% solve a feasibility problem 
    if (cvx_optval == Inf) || (cvx_optval == -Inf)
        fprintf(2,['solve a feasibility problem!' , '\n']); 
    cvx_clear
        cvx_begin
        cvx_solver mosek
        variables u(N) w(N) alpha
        minimize( alpha )
        subject to
            fun_w_bar_f_1i( u , w , u_i , w_i , f_italic_1_i , f_full_1_i , N , L , pho_i , tau_1 ,...
                mutN__Mb) <= alpha;
            sum( pow_p( [[1:N-1].*[2:N],N]' .* w , -1) ) <= alpha;
            w >= alpha * ones(N,1);
            exp( u(1:N-1) + w(2:N)) + exp( -w(1:N-1) + w(2:N) ) <= alpha * ones(N-1,1);
            exp( u(N) ) + exp( -w(N) ) <= alpha;         
        cvx_end
    end
    %% update coefficient
%     f_italic_0_i = ( 1 - pho_i ) * f_italic_0_i + pho_i * fun_w_g_0(u_i,k_i,N);
%     f_full_0_i   = ( 1 - pho_i ) * f_full_0_i   + pho_i * fun_w_grad_u_g_0(u_i,k_i,N);
%     f_italic_1_i = ( 1 - pho_i ) * f_italic_1_i + pho_i * fun_w_g_1(w_i,N,L,mutN__Mb);
%     f_full_1_i   = ( 1 - pho_i ) * f_full_1_i   + pho_i * fun_w_grad_w_g_1(w_i,N);
% -------
    scalar_f_italic_0_i = 0; vector_f_full_0_i = 0; scalar_f_italic_1_i = 0; vector_f_full_1_i = 0; 
    for i = 1:batchsize
        k_i = batchmatrix_k(i,:)';
        scalar_f_italic_0_i = scalar_f_italic_0_i + fun_w_g_0(u_i,k_i,N);
        vector_f_full_0_i   = vector_f_full_0_i   + fun_w_grad_u_g_0(u_i,k_i,N);
        scalar_f_italic_1_i = scalar_f_italic_1_i + fun_w_g_1(w_i,N,L,mutN__Mb);
        vector_f_full_1_i   = vector_f_full_1_i   + fun_w_grad_w_g_1(w_i,N);
    end
    scalar_f_italic_0_i = scalar_f_italic_0_i / batchsize;
    vector_f_full_0_i   = vector_f_full_0_i   / batchsize;
    scalar_f_italic_1_i = scalar_f_italic_1_i / batchsize;
    vector_f_full_1_i   = vector_f_full_1_i   / batchsize;
    
    f_italic_0_i = ( 1 - pho_i ) * f_italic_0_i + pho_i * scalar_f_italic_0_i;
    f_full_0_i   = ( 1 - pho_i ) * f_full_0_i   + pho_i * vector_f_full_0_i;
    f_italic_1_i = ( 1 - pho_i ) * f_italic_1_i + pho_i * scalar_f_italic_1_i;
    f_full_1_i   = ( 1 - pho_i ) * f_full_1_i   + pho_i * vector_f_full_1_i;
%--------
    % update u_i, w_i
    u_i = (1-gamma_i) * u_i + gamma_i * u;
    w_i = (1-gamma_i) * w_i + gamma_i * w;
    
    % update iter
    iter = iter + 1;
end
%% Estimate CDF by calculating time
fprintf(2,['--------------------------', [], '\n']);
w_get = w_i; u_get = u_i;
y_get = w_i / mutN__Mb; 
x_get =  (1./y_get - [0;1./y_get(1:N-1)] ) ./ [1:N]';
%% Rounding Alg.
x_get_int = fun_round_solution(x_get,L);
%% Estimate CDF
% CDF_est_proposed = fun_Est_CDF(t,x_get_int,num_sample,  N,mu,t_0,M,b);
% fprintf(2,['CDF_est_proposed = ', num2str(CDF_est_proposed), '\n']);
end