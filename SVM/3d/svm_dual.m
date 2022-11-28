function [lambda,b] = svm_dual(X,y,C,sigma)
%% using quadprog to solve the dual problem 
[row col] = size(X);         % size of X
K = gaussian_kernel(X,sigma);% using gaussian()

YY = y*y';
H = K.*YY;
f = -ones(row,1);
Aeq = y';
beq = 0;

lb = zeros(row,1);
ub = C*ones(row,1);

opts = optimset('Algorithm','interior-point-convex','display','off');
[lambda,fval,e,ignore,mults] = quadprog(H,f',[],[],Aeq,beq,lb,ub,[],opts);
lambda,fval,e,ignore,mults
b = mults.eqlin;

end