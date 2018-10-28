from __future__ import print_function
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
from torchvision import datasets, transforms
from torch.autograd import Variable
import matplotlib.pyplot as plt
import numpy as np

class Net(nn.Module):

    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(1, 10, kernel_size=5)
        self.conv2 = nn.Conv2d(10, 20, kernel_size=5) #(None,20,20,20)
        self.mp = nn.MaxPool2d(2)
        self.fc = nn.Linear(320, 10)

    def forward(self, x):
        in_size = x.size(0)
        x = F.relu(self.mp(self.conv1(x)))
        x = F.relu(self.mp(self.conv2(x)))
        x = x.view(in_size, -1)  # flatten the tensor
        x = self.fc(x)
        return x


def train(epoch,batch_size):
    model.train()
    train_loss=0.0
    for batch_idx, (data, target) in enumerate(train_loader):
        if torch.cuda.is_available():
            data, target = data.cuda(), target.cuda()
        data, target = Variable(data), Variable(target)         
        optimizer.zero_grad()
        output = model(data)
        loss = F.cross_entropy(output, target)
        loss.backward()
        optimizer.step()
        batch_loss= loss.data[0]
        train_loss += batch_loss
        if batch_idx % 100 ==0:
            print('\nTrain Epoch/batch| [{}/{}]: Average batch loss: {:.6f}\n'.format(epoch,batch_idx,batch_loss/batch_size))

    train_loss /= batch_idx*batch_size
    print('Train Epoch [{}]: \tLoss: {:.6f}'.format(epoch,  train_loss))
    torch.save(model,'model_epoch_{}.pkl'.format(epoch))
    return train_loss


def test(epoch,batch_size):
    model.eval()
    test_loss = 0.0
    correct = 0.0
    for batch_idx, (data, target) in enumerate(test_loader):
        if torch.cuda.is_available():
            data, target = data.cuda(), target.cuda()
        data, target = Variable(data, volatile=True), Variable(target)
        output = model(data)
        # sum up batch loss
        batch_loss= F.cross_entropy(output, target, size_average=False).data[0]
        test_loss+=batch_loss
        # get the index of the max log-probability
        pred = output.data.max(1, keepdim=True)[1]
        correct += pred.eq(target.data.view_as(pred)).cpu().sum()
        if batch_idx % 100 ==0:
            print('\nTest Epoch/batch| [{}/{}]: Average batch loss: {:.6f}\n'.format(epoch,batch_idx,batch_loss/batch_size))


    test_loss /= batch_idx*batch_size
    correct /= batch_idx*batch_size
    print('\nTest Epoch [{}]: Average loss: {:.6f}, Accuracy: ({:.6f}%)\n'.format(epoch,
        test_loss,100. * correct))
    return test_loss,correct

def plot_weights(weights):
    out_c,in_c,w,h = np.shape(weights)
    idx =3
    for i in range(out_c):
        weights_img = weights[i,idx,:,:]
        plt.figure()
        plt.imshow(weights_img,cmap='gray')
        plt.show()

def plot_features(features):
    batch,c,w,h = np.shape(features)
    idx =5
    for i in range(c):
        output_img = out[idx,i,:,:]
        plt.figure()
        plt.imshow(output_img,cmap='gray')
        plt.show()
if __name__ == '__main__':
    # Training settings
    batch_size = 32

    # MNIST Dataset
    train_dataset = datasets.MNIST(root='./mnist',
                                   train=True,
                                   transform=transforms.ToTensor(),
                                   download=False)
    test_dataset = datasets.MNIST(root='./mnist',
                                  train=False,
                                  transform=transforms.ToTensor())

    # Data Loader (Input Pipeline)
    train_loader = torch.utils.data.DataLoader(dataset=train_dataset,
                                               batch_size=batch_size,
                                               shuffle=True)

    test_loader = torch.utils.data.DataLoader(dataset=test_dataset,
                                              batch_size=batch_size,
                                              shuffle=False)
    from torchvision.models import resnet34
    model = Net()
    
    if torch.cuda.is_available():
        model.cuda()

    #sub_modules = [model.conv1,model.conv2,model.mp,model.fc]
    #for param in model.parameters():
    #    param.requires_grad = False
    #params = [{'params':md.parameters(),'lr':0.005} for md in sub_modules]
    #conv1_params = {'params':model.conv1.parameters(),'lr':0.05} 
    #conv2_params = {'params':model.conv2.parameters(),'lr':0.01,'momentum':0.65} 
    #mp_params =  {'params':model.mp.parameters()}
    #fc_parms =  {'params':model.fc.parameters(),'lr':0.002}
    #params = list()
    #params.append(conv1_params)
    #params.append(conv2_params)
    #params.append(mp_params)
    #params.append(fc_parms)
    #optimizer = optim.SGD(params, lr=0.01, momentum=0.5)
    #optimizer = optim.ASGD(model.parameters(), lr=0.001)
    optimizer = optim.Adam(model.parameters(), lr=0.001)
    #optimizer = optim.SGD(model.parameters(), lr=0.001)
    #optimizer = optim.SGD(model.parameters(), lr=0.01, momentum=0.5)
    scheduler = torch.optim.lr_scheduler.StepLR(optimizer, step_size=5, gamma=0.1)
    #scheduler = torch.optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.95)
    #for epoch in range(1, 5):
    #    scheduler.step()
    #    train(epoch,batch_size)
    #    test(epoch,batch_size)

    model_load = torch.load('model_epoch_3.pkl')
    model_list = list(model_load.children())
    model_features = model_list[0:2]
    model_new = torch.nn.Sequential(*model_features)
    for batch_idx, (data, target) in enumerate(test_loader):
        data, target = Variable(data, volatile=True), Variable(target)
        if torch.cuda.is_available():
            data, target = data.cuda(), target.cuda()
        break
    output = model_new(data)
    #可视化特征输出
    out = output.cpu().data.numpy()
    plot_features(out)
  
    #可视化卷积核
    weights = model_load.conv2._parameters['weight']
    weights = weights.cpu().data.numpy()
    plot_weights(weights)





