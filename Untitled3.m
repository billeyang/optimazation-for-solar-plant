n = 2;
K = 11;
randn('state',0);
P = randn(n,K);

% L1 - norm
fprintf(1,'Minimizing the L1-norm of the sum of the distances to fixed points...');

cvx_begin
    variable x1(2)
    minimize ( sum(norms(x1*ones(1,K) - P,1)) )
cvx_end

fprintf(1,'Done! \n');

% L2 - norm
fprintf(1,'Minimizing the L2-norm of the sum of the distances to fixed points...');

cvx_begin
    variable x2(2)
    minimize ( sum(norms(x2*ones(1,K) - P,2)) )
cvx_end

fprintf(1,'Done! \n');

% Displaying results
disp('------------------------------------------------------------------');
disp('The optimal point location for the L1-norm case is: ');
disp(x1);
disp('The optimal point location for the L2-norm case is: ');
disp(x2);