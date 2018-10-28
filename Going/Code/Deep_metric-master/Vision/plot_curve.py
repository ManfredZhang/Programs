# coding=utf-8

import numpy as np
import matplotlib.pyplot as plt  # 导入模块

r = np.load("result-product.npz") #加载一次即可
print(r)
print(r.files)

loss = r['loss']
epoch = r['epoch']

pos = r['pos']
neg = r['neg']

plt.plot(epoch, loss)
plt.savefig('product_loss_epoch.jpg')

plt.show()  # 输出图像


plot1 = plt.plot(epoch, neg, label='Negative Dist')
plot2 = plt.plot(epoch, pos, label='Positive  Dist')
plt.xlabel('Epoch')
plt.ylabel('Distance')
plt.legend(loc='upper right', numpoints=1)
plt.savefig('product_dist_epoch.jpg')

plt.show()  # 输出图像



