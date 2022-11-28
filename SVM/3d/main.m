clc;clear
%%
% main 
% 使用quadprog 求解凸优化实现 SVM-软间隔基本问题
% @author haoqi
% @version 1
% */
%% 载入数据
load('trainData.txt')
X = trainData(:,1:2);
X  = zscore(X); % 数据标准化
Y = trainData(:,3);

% 2-8 fold

X_test = X(ceil(length(X)*1):end,:)
Y_test = Y(ceil(length(X)*1):end,:)

X = X(1:ceil(length(X)*1),:);
Y = Y(1:length(X),:);


class1 = X((Y(:,1)==1),:);
class2 = X((Y(:,1)==-1),:);
[m n]=size(X);
%% 设置参数调整过程
c = 1000;
sigma = 10;
lambda = zeros(m,1,5,6);
b = zeros(1,5,6);
accuracy = zeros(4,5);
k = 0;% idx of subplot

%% 生成阵点
xx = linspace(min(X(:,1))-0.5,max(X(:,1))+0.5,50);
yy = linspace(min(X(:,2))-0.5,max(X(:,2))+0.5,50);
[x1,y1] = meshgrid(xx,yy);
%%训练结束，开始画图
for i=1:1
    for j=1:1
        k= k+1;
        [lambda(:,:,i,j) b(:,i,j)] = svm_dual(X,Y,c(i),sigma(j));
        W= lambda(:,:,i,j);
        %subplot(4,5,k)
        %% plot orgin data
            
         scatter(class1(:,1),class1(:,2),150,'y','filled');
         hold on
         scatter(class2(:,1),class2(:,2),150,'b','filled');
         suppter_v_index = find(W>0.9); % support vectors(SVs)
         suppter_v = X(suppter_v_index,:);
         hold on 
         set(gca,'FontName','Times New Roman','FontSize',50,'LineWidth',1.5);
         plot(suppter_v(:,1),suppter_v(:,2),'o')
         hold on
        %% show super-face
        %accuracy(i,j) = svm_dual_accuracy(X,Y,X_test,Y_test,sigma(j),lambda(:,:,i,j),b(:,i,j));
        
        grid_data = svm_grid(X,Y, x1,y1, sigma(j),lambda(:,:,i,j),b(:,i,j));
        
        contour(x1,y1,grid_data,[-1 0 1],'Color', 'r','LineWidth',1.5,'linestyle','--')
        %grid on
        
        titlestr = strcat('Gaussian Kernel');
        title(titlestr);
    end
end
