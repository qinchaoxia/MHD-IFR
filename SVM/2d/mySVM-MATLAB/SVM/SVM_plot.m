function SVM_plot(X,Y,alpha,beta0,kernel)
% X is with 2 coloums

global Cost poly_con gamma kappa1
figure
hold on
P = size(X,2);

if P ~=2
   warning('# of input X should be 2 for the 2D visualization!!')
end
set(gca,'FontName','Times New Roman','FontSize',50,'LineWidth',1.5);
class1 = X((Y(:,1)==1),:);
class2 = X((Y(:,1)==-1),:);       
scatter(class1(:,1),class1(:,2),150,'y','filled');
hold on
scatter(class2(:,1),class2(:,2),150,'b','filled');
         
%
d = 0.02;
[x1Grid,x2Grid] = meshgrid(min(X(:,1))-0.5:max(X(:,1))+0.5,...
    min(X(:,2))-0.5:max(X(:,2))+0.5);
xGrid = [x1Grid(:),x2Grid(:)];
scores = SVM_pred(xGrid, X, Y,kernel,alpha,beta0);

contour(x1Grid,x2Grid,reshape(scores,size(x1Grid)),[0 0],'r',...
    'LineWidth', 1.5,'linestyle','--');
titlestr = strcat('Linear Kernel');
title(titlestr);
hold off
return