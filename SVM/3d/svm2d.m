figure
load('trainData.txt')
X = trainData(:,1:2);
X  = zscore(X); % 数据标准化
Y = trainData(:,3);

class1 = X((Y(:,1)==1),:);
class2 = X((Y(:,1)==-1),:);
scatter(class1(:,1),class1(:,2),150,'y','filled');
hold on
scatter(class2(:,1),class2(:,2),150,'b','filled');
hold on
set(gca,'FontName','Times New Roman','FontSize',50,'LineWidth',1.5);
titlestr = strcat('2D Space');
title(titlestr);