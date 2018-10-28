# Simple Convolutional Autoencoder
# Code by GunhoChoi

import torch
import torch.nn as nn
import torch.utils as utils
from torch.autograd import Variable
import torchvision.datasets as dset
import torchvision.transforms as transforms
import numpy as np
import matplotlib.pyplot as plt
from collections import OrderedDict
# Set Hyperparameters

epoch = 1
batch_size = 64
learning_rate = 0.001


# Encoder 
# torch.nn.Conv2d(in_channels, out_channels, kernel_size,
#                 stride=1, padding=0, dilation=1,
#                 groups=1, bias=True)
# batch x 1 x 28 x 28 -> batch x 512

# loss func and optimizer
# we compute reconstruction after decoder so use Mean Squared Error
# In order to use multi parameters with one optimizer,
# concat parameters after changing into list
def initialize_weights(net):
    for m in net.modules():
        if isinstance(m, nn.Conv2d):
            torch.nn.init.normal(m.weight,mean=0, std=0.02)
            torch.nn.init.constant(m.bias,0.01)
            #print(m.bias.data)
        elif isinstance(m, nn.ConvTranspose2d):
            torch.nn.init.normal(m.weight,mean=0, std=0.02)
            torch.nn.init.constant(m.bias,0.0)
        elif isinstance(m, nn.Linear):
            torch.nn.init.normal(m.weight,mean=0, std=0.01)
            torch.nn.init.constant(m.bias,0.0)

class Encoder(nn.Module):
    def __init__(self):
        super(Encoder,self).__init__()
        self.layer1 = nn.Sequential(
                        nn.Conv2d(1,16,3,padding=1),   # batch x 16 x 28 x 28
                        nn.ReLU(),
                        nn.BatchNorm2d(16),
                        nn.Conv2d(16,32,3,padding=1),  # batch x 32 x 28 x 28
                        nn.ReLU(),
                        nn.BatchNorm2d(32),
                        nn.Conv2d(32,64,3,padding=1),  # batch x 64 x 28 x 28
                        nn.ReLU(),
                        nn.BatchNorm2d(64),
                        nn.MaxPool2d(2,2)   # batch x 64 x 14 x 14
        )
        self.layer2 = nn.Sequential(
                        nn.Conv2d(64,128,3,padding=1),  # batch x 128 x 14 x 14
                        nn.ReLU(),
                        nn.BatchNorm2d(128),
                        nn.MaxPool2d(2,2),
                        nn.Conv2d(128,256,3,padding=1),  # batch x 256 x 7 x 7
                        nn.ReLU()
        )
        initialize_weights(self)
        
                
    def forward(self,x):
        out = self.layer1(x)
        out = self.layer2(out)
        out = out.view(batch_size, -1)
        return out
    #def 
    


# Decoder 
# torch.nn.ConvTranspose2d(in_channels, out_channels, kernel_size,
#                          stride=1, padding=0, output_padding=0,
#                          groups=1, bias=True)
# output_height = (height-1)*stride + kernel_size - 2*padding + output_padding
# batch x 512 -> batch x 1 x 28 x 28

class Decoder(nn.Module):
    def __init__(self):
        super(Decoder,self).__init__()
        self.layer1 = nn.Sequential(OrderedDict([
                        ('convTp1',nn.ConvTranspose2d(256,128,3,2,1,1)), # batch x 128 x 14 x 14
                        ('relu1',nn.ReLU()),
                        ('bn1',nn.BatchNorm2d(128)),
                        ('convTp2',nn.ConvTranspose2d(128,64,3,1,1)),  # batch x 64 x 14 x 14
                        ('relu2',nn.ReLU()),
                        ('bn2',nn.BatchNorm2d(64)),
                        ])) 
        self.layer2 = nn.Sequential(OrderedDict([
                        ('convTp3',nn.ConvTranspose2d(64,16,3,1,1)), # batch x 16 x 14 x 14
                        ('relu3',nn.ReLU()),
                        ('bn3',nn.BatchNorm2d(16)),
                        ('convTp4',nn.ConvTranspose2d(16,1,3,2,1,1)), # batch x 1 x 28 x 28
                        ('relu4',nn.ReLU()),
                        ]))
        initialize_weights(self)
        
    def forward(self,x):
        out = x.view(batch_size,256,7,7)
        out = self.layer1(out)
        out = self.layer2(out)
        return out

encoder = Encoder()
print(encoder._modules.keys())
print(encoder._modules['layer1']._modules.keys())
print(encoder._modules['layer2']._modules.keys())
print(list(encoder.children()))
decoder = Decoder()
print(decoder._modules.keys())
print(decoder._modules['layer1']._modules.keys())
print(decoder._modules['layer2']._modules.keys())
print(list(decoder.children()))
if torch.cuda.is_available():
    encoder.cuda()
    decoder.cuda()

# Download Data

mnist_train = dset.MNIST("./mnist", train=True, transform=transforms.ToTensor(), target_transform=None, download=True)
mnist_test  = dset.MNIST("./mnist", train=False, transform=transforms.ToTensor(), target_transform=None, download=True)

# Set Data Loader(input pipeline)

train_loader = torch.utils.data.DataLoader(dataset=mnist_train,batch_size=batch_size,shuffle=True,drop_last=True)

opt_modules = list()
opt_modules.append(encoder._modules['layer1']._modules['0'])
opt_modules.append(encoder._modules['layer1']._modules['3'])
opt_modules.append(encoder._modules['layer1']._modules['6'])
opt_modules.append(decoder._modules['layer2']._modules['convTp3'])
opt_modules.append(decoder._modules['layer2']._modules['convTp4'])

parameters = [{'params':md.parameters()} for md in opt_modules]
loss_func = nn.MSELoss()
optimizer = torch.optim.Adam(parameters, lr=learning_rate)

# train encoder and decoder

try:
	#encoder, decoder = torch.load('./model/autoencoder.pkl')
	print("\n--------model restored--------\n")
except:
	pass

for i in range(epoch):
    for idx,(image,label) in enumerate(train_loader):
        image = Variable(image).cuda()
        #label = Variable(label.float()).cuda()
        optimizer.zero_grad()
        output = encoder(image)
        output = decoder(output)
        loss = loss_func(output,image)
        loss.backward()
        optimizer.step()
        if idx % 10 ==0:
            print('Train Epoch: {}:{} \tLoss: {:.6f}'.format(
                i,idx, loss.data[0]))
        
#torch.save([encoder,decoder],'./model/autoencoder.pkl')

torch.save([encoder,decoder],'encoder_decoder.pkl')


encoder, decoder = torch.load('encoder_decoder.pkl')
encoder_conv1_params = {'params':encoder._modules['layer1']._modules['0'].parameters(),'lr':0.001} 
decoder_convTp1_params = {'params':decoder._modules['layer1']._modules['convTp1'].parameters(),'lr':0.002} 
params = list()
params.append(encoder_conv1_params)
params.append(decoder_convTp1_params)
optimizer = torch.optim.Adam(params, lr=0.005)
for i in range(1):
    for idx,(image,label) in enumerate(train_loader):
        image = Variable(image).cuda()
        #label = Variable(label.float()).cuda()
        optimizer.zero_grad()
        output = encoder(image)
        output = decoder(output)
        loss = loss_func(output,image)
        loss.backward()
        optimizer.step()
        if idx % 10 ==0:
            print('Train Epoch: {}:{} \tLoss: {:.6f}'.format(
                i,idx, loss.data[0]))

torch.save(encoder._modules['layer1']._modules['0'].state_dict(),'encoder_submodel_dict_state.pkl')
torch.save(decoder._modules['layer1']._modules['convTp1'].state_dict(),'decoder_submodel_dict_state.pkl')

encoder, decoder = torch.load('encoder_decoder.pkl')
encoder._modules['layer1']._modules['0'].load_state_dict(torch.load('encoder_submodel_dict_state.pkl'))
decoder._modules['layer1']._modules['convTp1'].load_state_dict(torch.load('decoder_submodel_dict_state.pkl'))
encoder_conv1_params = {'params':encoder._modules['layer1']._modules['0'].parameters(),'lr':0.002} 
decoder_convTp1_params = {'params':decoder._modules['layer1']._modules['convTp1'].parameters(),'lr':0.001} 
params = list()
params.append(encoder_conv1_params)
params.append(decoder_convTp1_params)
optimizer = torch.optim.Adam(params, lr=0.005)
for i in range(1):
    for idx,(image,label) in enumerate(train_loader):
        image = Variable(image).cuda()
        #label = Variable(label.float()).cuda()
        optimizer.zero_grad()
        output = encoder(image)
        output = decoder(output)
        loss = loss_func(output,image)
        loss.backward()
        optimizer.step()
        if idx % 10 ==0:
            print('Train Epoch: {}:{} \tLoss: {:.6f}'.format(
                i,idx, loss.data[0]))

input_img = image[0].cpu()
output_img = output[0].cpu()

inp = input_img.data.numpy()
out = output_img.data.numpy()

plt.imshow(inp[0],cmap='gray')
plt.show()

plt.imshow(out[0],cmap="gray")
plt.show()
