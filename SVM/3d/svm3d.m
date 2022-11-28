figure
load('trainData.txt')
X = trainData(:,1:3);

class1 = X(X(:,3)==1,:);
class2 = X(X(:,3)==-1,:);
x1 = zscore(class1(:,1:2))
x2 = zscore(class2(:,1:2))
scatter3(x1(:,1),x1(:,2),class1(:,3),150,'b','filled')
hold on
scatter3(x2(:,1),x2(:,2),class2(:,3),150,'y','filled')
hold on
set(gca,'FontName','Times New Roman','FontSize',50,'LineWidth',1.5);
titlestr = strcat('3D Space');
title(titlestr);