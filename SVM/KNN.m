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
r = 0.5;%半径
a = 0;%圆心横坐标
b = 1;%圆心纵坐标
t=0:0.1:2.1*pi;
x=a+r*cos(t);
y=b+r*sin(t);
plot(x,y,'r','linewidth',2,'linestyle','--');
hold on
r = 1;%半径
a = 0;%圆心横坐标
b = 1;%圆心纵坐标
t=0:0.1:2.1*pi;
x=a+r*cos(t);
y=b+r*sin(t);
plot(x,y,'r','linewidth',2,'linestyle','--');
hold on
set(gca,'FontName','Times New Roman','FontSize',50,'LineWidth',1.5);
titlestr = strcat('KNN');
title(titlestr);