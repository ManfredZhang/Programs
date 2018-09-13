%% https://blog.csdn.net/guyuealian/article/details/68487833
%% 样本矩阵X，有8个样本，每个样本有4个特征，使用PCA降维提取k个主要特征（k<4）
k = 2;                            %将样本降到k维参数设置
X = [1 2 1 1;                     %样本矩阵
      3 3 1 2; 
      3 5 4 3; 
      5 4 5 4;
      5 6 1 5; 
      6 5 2 6;
      8 7 1 2;
      9 8 3 7]
[Row, Col] = size(X);
covX = cov(X);              %求样本的协方差矩阵（散步矩阵除以(n-1)即为协方差矩阵）
[V, D] = eigs(covX);        %求协方差矩阵的特征值D和特征向量V
meanX = mean(X);            %样本均值m
%% 所有样本X减去样本均值m，再乘以协方差矩阵（散步矩阵）的特征向量V，即为样本的主成份SCORE
tempX = repmat(meanX,Row,1);
SCORE = (X-tempX)*V                              %主成份：SCORE
pcaData2 = SCORE(:,1:k)     %所有列，从第一行开始到第k行 

