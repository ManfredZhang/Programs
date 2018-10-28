# -*- encoding: utf-8 -*-
import torch.nn as nn


class SiameseNetwork(nn.Module):
    def __init__(self,out_dim=64):
            super(SiameseNetwork, self).__init__()
        
            # Convolution 1
            self.cnn1 = nn.Conv2d(in_channels=1, out_channels=16, kernel_size=5, stride=1, padding=0)
            self.bn1 = nn.BatchNorm2d(16)
            self.relu1 = nn.ReLU()
            # Max pool 1
            self.maxpool1 = nn.MaxPool2d(kernel_size=2)
     
            # Convolution 2
            self.cnn2 = nn.Conv2d(in_channels=16, out_channels=32, kernel_size=5, stride=1, padding=0)
            self.bn2 = nn.BatchNorm2d(32)
            self.relu2 = nn.ReLU()
        
            # Max pool 2
            self.maxpool2 = nn.MaxPool2d(kernel_size=2)
        
            self.dropout1 = nn.Dropout(p=0.5)
            self.dropout2 = nn.Dropout(p=0.35)
            # Fully connected 1 (readout)
            self.fc1 = nn.Linear(32*4*4, 512)
            self.fc2 = nn.Linear(512, 256)
            self.fc3 = nn.Linear(256, out_dim)
    
    def forward_once(self, x):
        # Convolution 1
        out = self.cnn1(x)
        out = self.bn1(out)
        out = self.relu1(out)
        
        # Max pool 1
        out = self.maxpool1(out)
        
        # Convolution 2 
        out = self.cnn2(out)
        out = self.bn2(out)
        out = self.relu2(out)
        
        # Max pool 2 
        out = self.maxpool2(out)
        
        # Resize
        # Original size: (100, 32, 7, 7)
        # out.size(0): 100
        # New out size: (100, 32*7*7)
        out = out.view(out.size(0), -1)
        #out = self.dropout1(out)
        # Linear function (readout)
        out = self.fc1(out)
        out = self.dropout1(out)
        out = self.fc2(out)
        out = self.dropout2(out)
        out = self.fc3(out)
        
        return out

    def forward(self, input1, input2):
        output1 = self.forward_once(input1)
        output2 = self.forward_once(input2)
        return output1, output2
