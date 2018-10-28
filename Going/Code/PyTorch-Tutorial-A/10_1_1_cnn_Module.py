
from __future__ import print_function
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
from torchvision import datasets, transforms
from torch.autograd import Variable


class Net(nn.Module):

    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(1, 10, kernel_size=5)
        self.conv2 = nn.Conv2d(10, 20, kernel_size=5)
        self.mp = nn.MaxPool2d(2)
        self.fc = nn.Linear(320, 10)

    def forward(self, x):
        in_size = x.size(0)
        x = F.relu(self.mp(self.conv1(x)))
        x = F.relu(self.mp(self.conv2(x)))
        x = x.view(in_size, -1)  # flatten the tensor
        x = self.fc(x)
        return x


def train(epoch):
    model.train()
    #adjust_learning_rate(optimizer,epoch,5)
    for batch_idx, (data, target) in enumerate(train_loader):
        if torch.cuda.is_available():
            data, target = data.cuda(), target.cuda()
        data, target = Variable(data), Variable(target)         
        optimizer.zero_grad()
        output = model(data)
        loss = F.cross_entropy(output, target)
        loss.backward()
        optimizer.step()
        if batch_idx % 10 == 0:
            print('Train Epoch: {} [{}/{} ({:.0f}%)]\tLoss: {:.6f}'.format(
                epoch, batch_idx * len(data), len(train_loader.dataset),
                100. * batch_idx / len(train_loader), loss.data[0]))


def test():
    model.eval()
    test_loss = 0
    correct = 0
    for data, target in test_loader:
        if torch.cuda.is_available():
            data, target = data.cuda(), target.cuda()
        data, target = Variable(data, volatile=True), Variable(target)
        output = model(data)
        # sum up batch loss
        test_loss += F.cross_entropy(output, target, size_average=False).data[0]
        # get the index of the max log-probability
        pred = output.data.max(1, keepdim=True)[1]
        correct += pred.eq(target.data.view_as(pred)).cpu().sum()

    test_loss /= len(test_loader.dataset)
    print('\nTest set: Average loss: {:.4f}, Accuracy: {}/{} ({:.0f}%)\n'.format(
        test_loss, correct, len(test_loader.dataset),
        100. * correct / len(test_loader.dataset)))
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
    model = Net()
    print(model._modules.keys())


    for name,module in model.named_children():
        print(name,module)
    children_modules = {name:module for name,module in model.named_children()}
    print(children_modules.keys())
    

    if torch.cuda.is_available():
        model.cuda()

    #conv1_params = {'params':children_modules['conv1'].parameters(),'lr':0.05} 
    #conv2_params = {'params':children_modules['conv2'].parameters(),'lr':0.01,'momentum':0.65} 
    #mp_params =  {'params':children_modules['mp'].parameters()}
    #fc_parms =  {'params':children_modules['fc'].parameters(),'lr':0.002}
    conv1_params = {'params':model._modules['conv1'].parameters(),'lr':0.05} 
    conv2_params = {'params':model._modules['conv2'].parameters(),'lr':0.01,'momentum':0.65} 
    mp_params =  {'params':model._modules['mp'].parameters()}
    fc_parms =  {'params':model._modules['fc'].parameters(),'lr':0.002}
    params = list()
    params.append(conv1_params)
    params.append(conv2_params)
    params.append(mp_params)
    params.append(fc_parms)
    optimizer = optim.SGD(params, lr=0.01, momentum=0.5)
    #optimizer = optim.SGD(model.parameters(), lr=0.01, momentum=0.5)
    scheduler = torch.optim.lr_scheduler.StepLR(optimizer, step_size=5, gamma=0.1)
    #scheduler = torch.optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.95)
    for epoch in range(1, 20):
        scheduler.step()
        train(epoch)
        test()
