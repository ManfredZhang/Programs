# -*- encoding: utf-8 -*-
import argparse
import torch
import torchvision.datasets as dsets
import random
import numpy as np
import time
import matplotlib.pyplot as plt
import pandas as pd

import os

from torch.autograd import Variable
from torchvision import transforms
#from net import SiameseNetwork
from model_02 import SiameseNetwork

parser = argparse.ArgumentParser()
parser.add_argument('--epoch', '-e', type=int, default=50,
                    help='Number of sweeps over the dataset to train')
parser.add_argument('--batch-size', '-b', type=int, default=128,
                    help='Number of images in each mini-batch')
parser.add_argument('--out-dim', type=int, default=128,
                help='out_dim')
parser.add_argument('--n-samples', type=int, default=200,
                help='n-samples')
parser.add_argument('--no-cuda', action='store_true', default=False,
                    help='disables CUDA training')
parser.add_argument('--model', '-m', default='',
                    help='Give a model to test')

args = parser.parse_args()
args.cuda = not args.no_cuda and torch.cuda.is_available()
print("Args: %s" % args)


def load_checkpoint_from_filename(net,file_name):
    print("loading model from file_name...{}".format(file_name))
    checkpoint_path_name =  os.path.join('./', file_name)
    checkpoint = torch.load(checkpoint_path_name)
    net.load_state_dict(checkpoint)
    

def main():
    batch_size = args.batch_size
    # MNIST Dataset
    train_dataset = dsets.MNIST(root='./mnist',
                                   train=True,
                                   transform=transforms.ToTensor(),
                                   download=False)
    test_dataset = dsets.MNIST(root='./mnist',
                                  train=False,
                                  transform=transforms.ToTensor())

    # Data Loader (Input Pipeline)
    train_loader = torch.utils.data.DataLoader(dataset=train_dataset,
                                               batch_size=batch_size,
                                               shuffle=True)

    test_loader = torch.utils.data.DataLoader(dataset=test_dataset,
                                              batch_size=batch_size,
                                              shuffle=False)
    model =SiameseNetwork(out_dim=args.out_dim)
    load_checkpoint_from_filename(model,'model-{}-{}.pth'.format(args.n_samples,args.out_dim))
    if torch.cuda.is_available():
        model.cuda()
    data=[]
    label=[]
    #for i, (x, y) in enumerate(train_loader):
    for i, (x, y) in enumerate(test_loader):
        x = Variable(x)
        y = Variable(y)
        if torch.cuda.is_available():
            x = x.cuda()
            y = y.cuda()
        output = model.forward_once(x)
        output,y = output.data.tolist(),y.data.tolist()
        data.extend(output)
        label.extend(y)
    
    data = np.array(data).astype(float)
    label = np.array(label).astype(int)
    label = label[:, np.newaxis]
    _data = np.concatenate((data,label),axis=1)
    df = pd.DataFrame(_data)

    #df.to_csv('train_data_{}-{}-all.csv'.format(args.n_samples,args.out_dim),mode='w+')
    df.to_csv('test_data_{}-{}-all.csv'.format(args.n_samples,args.out_dim),mode='w+')

    print('end....')
if __name__ == '__main__':
    main()
