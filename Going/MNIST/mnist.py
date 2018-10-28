
# coding: utf-8

# In[3]:


from __future__ import print_function
import torch
import torch.nn as nn # 神经网络
import torch.nn.functional as F
import torch.optim as optim # 优化算法
from torchvision import datasets, transforms
from torch.autograd import Variable # 自动求梯度


# In[4]:


batch_size = 32 #批的大小
train_dataset = datasets.MNIST(root='./data/', train = True,
                              transform = transforms.ToTensor(), 
                              download = True)
test_dataset = datasets.MNIST(root='./data/', train = False,
                            transform = transforms.ToTensor())


# In[5]:


train_loader = torch.utils.data.DataLoader(dataset=train_dataset, 
                                           batch_size = batch_size, shuffle = True)
test_loader = torch.utils.data.DataLoader(dataset=test_dataset,
                                          batch_size = batch_size, shuffle = False)


# In[6]:


class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(1, 10, kernel_size=5)
        # 调用2维卷积，1channel输入，10channel输出
        self.conv2 = nn.Conv2d(10, 20, kernel_size=5)
        # 调用2维卷积，10通道输入，20通道输出
        self.mp = nn.MaxPool2d(2)
        # maxpooling层 2*2 的窗大小
        self.fc = nn.Linear(320, 10)
        # 28*28 经过各种层后剩余320，输出10个分类
        
        # 在 init 函数中定义的一般都是有参数的层
        # 而像 relu 层无参数一般在下面直接调用函数
    def forward(self, x): # x是前馈的输入数据
        in_size = x.size(0) # 样本的数量
        x = F.relu(self.mp(self.conv1(x)))
        x = F.relu(self.mp(self.conv2(x)))
        x = x.view(in_size, -1) # flatten the tensor
        x = self.fc(x)
        return x


# In[8]:


model = Net() # 创建一个实例
if torch.cuda.is_available():
    model.cuda()

# 定义优化函数SGD随机梯度下降
params = [{'params':md.parameters()} for md in model.modules()
    if md in [model.conv1, model.conv2, model.mp, model.fc]]
optimizer = optim.SGD(params, lr=0.01, momentum=0.5)
# 以上三行相当于加入所有参数，但以上把参数列出来便于今后调试，只训练部分层的情况
# optimizer = optim.SGD(model.parameters(), lr=0.01, momentum=0.5)


# In[11]:


def train(epoch):
       model.train() # 训练阶段
       for batch_idx, (data, target) in enumerate(train_loader):
           if torch.cuda.is_available():
               data, target = data.cuda(), target.cuda()
           data, target = Variable(data), Variable(target)
           optimizer.zero_grad()
           output = model(data)
           loss = F.cross_entropy(output, target)
           loss.backward()
           optimizer.step()
           # 每10个批显示一次
           if batch_idx % 10 == 0:
               print('zmf: Train Epoch: {} [{}/{} ({:.0f}%)]\t Loss: {:.6f}'.format(
               epoch, batch_idx * len(data), len(train_loader.dataset), 
               100. * batch_idx / len(train_loader), loss.data[0]))
               # 第几轮，批编号，有多少数据，训练集每一次枚举的长度，进度显示，损失


# In[14]:


def test():
    model.eval() # 测试阶段
    test_loss = 0
    correct = 0
    for data, target in test_loader: # 直接把data和target从枚举器中取出来
        # 对数据做一下封装
        if torch.cuda.is_available():
            data, target = data.cuda(), target.cuda()
        data, target = Variable(data), Variable(target)
        
        output = model(data)
        # sum up batch loss
        test_loss += F.cross_entropy(output, target, size_average=False).data[0]
        # 一个位置是极值，第二个是极值的index
        pred = output.data.max(1, keepdim=True)[1]
        # 将pred的位置和标签相比对，先将标签（numpy数据）转到cpu里
        correct += pred.eq(target.data.view_as(pred)).cpu().sum()
        
    test_loss /= len(test_loader.dataset)
    print('\nTest set: Average loss: {:.4f}, Accuracy: {}/{} ({:.0f}%)\n'.format(
    test_loss, correct, len(test_loader.dataset),
    100. * correct / len(test_loader.dataset)
    ))


# In[15]:


for epoch in range(1, 10):
    train(epoch)
    test()

