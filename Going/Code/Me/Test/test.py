
import os



import torch
from torch.autograd import Variable
import torch.nn as nn
import torch.nn.functional as F
import torchvision
import numpy as np



class LeNet(nn.Module):
    def __init__(self,num_classes=10):
        super(LeNet, self).__init__()
        self.conv1 = nn.Conv2d(3, 6, 5)
        self.conv2 = nn.Conv2d(6, 16, 5)
        list = [
        nn.Conv2d(16, 16, kernel_size=1),
        nn.ReLU(inplace=True),
    ]
        self.conv3 = nn.Sequential(*list)

        self.fc1   = nn.Linear(16*5*5, 120)
        self.fc2   = nn.Linear(120, 84)
        self.fc3   = nn.Linear(84, num_classes)

    def forward(self, x):
        out = F.relu(self.conv1(x))
        out = F.max_pool2d(out, 2)
        out = F.relu(self.conv2(out))
        out = F.max_pool2d(out, 2)
        out = out.view(out.size(0), -1)
        out = F.relu(self.fc1(out))
        out = F.relu(self.fc2(out))
        out = self.fc3(out)
        return out

model = LeNet()
print('children....')
for mod in model.children():
    print(mod)

start=0
end=3
m_list = nn.ModuleList(list(model.children())[start:end])
for m in m_list:
    print(m)



