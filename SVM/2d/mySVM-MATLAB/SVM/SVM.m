%June11,2016
%SVM
function [alpha,Ker,beta0]=SVM(X,Y,kernel)
% X is N*p, Y is N*1,{-1,1}
% Constant=Inf for Hard Margin
global  precision Cost

switch kernel
    case 'linear'
        Ker=Ker_Linear(X,X);
    case 'ploynomial'
        Ker=Ker_Polynomial(X,X);
    case 'RBF'
        Ker=Ker_RBF(X,X);
    case 'Sigmoid'
        Ker=Ker_Sigmoid(X,X);
end

N= size(X,1);
H= diag(Y)*Ker*diag(Y);
f= - ones(N,1);
Aeq=Y';
beq=0;
A=[];
b=[];
lb = zeros(N,1);
ub = repmat(Cost,N,1);
alpha=quadprog(H,f,A,b,Aeq,beq, lb, ub);



serial_num=(1:size(X,1))';
serial_sv=serial_num(alpha>precision&alpha<Cost);

temp_beta0=0;
for i=1:size(serial_sv,1)
    temp_beta0=temp_beta0+Y(serial_sv(i));
    temp_beta0=temp_beta0-sum(alpha(serial_sv(i))*...
        Y(serial_sv(i))*Ker(serial_sv,serial_sv(i)));
end
beta0=temp_beta0/size(serial_sv,1);

return










