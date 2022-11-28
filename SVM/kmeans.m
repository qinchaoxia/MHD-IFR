clc;
clear;

load('trainData.txt')
X = trainData(:,1:2);
X  = zscore(X); % 数据标准化
Y = trainData(:,3);

class1 = X((Y(:,1)==1),:);
class2 = X((Y(:,1)==-1),:);

% 显示数据
%figure();
%hold on;
%plot(data1(:,1), data1(:,2), 'y+');
%plot(data2(:,1), data2(:,2), 'b+');
%grid on;


data = [class1; class2];
% 数据聚类
[idx, ctr] = k_means(data, 2, 1000);
[m, n] = size(idx);

% 显示聚类后的结果
figure();
hold on;
for i=1:m
    if idx(i, 3) == 1
        plot(idx(i, 1), idx(i, 2), 'y.', 'MarkerSize', 40); 
    else
        plot(idx(i, 1), idx(i, 2), 'b.', 'MarkerSize', 40);
    end
end
grid on;

% 绘出聚类中心点，kx表示是交叉符
plot(ctr(:,1), ctr(:,2), 'rx', 'MarkerSize', 12, 'LineWidth', 2);
set(gca,'FontName','Times New Roman','FontSize',50,'LineWidth',1.5);
titlestr = strcat('Kmeans');
title(titlestr);