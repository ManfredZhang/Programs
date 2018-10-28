%% https://blog.csdn.net/guyuealian/article/details/68487833
%% 样本矩阵X，有8个样本，每个样本有4个特征，使用PCA降维提取k个主要特征（k<4）
k=2;                            %将样本降到k维参数设置
X=[1 2 1 1;                     %样本矩阵
      3 3 1 2; 
      3 5 4 3; 
      5 4 5 4;
      5 6 1 5; 
      6 5 2 6;
      8 7 1 2;
      9 8 3 7];
%% 使用Matlab工具箱princomp函数实现PCA
pca(X)
[COEFF, SCORE, latent]=pca(X)
pcaData1=SCORE(:,1:k);            %取前k个主成分