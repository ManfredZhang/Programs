# coding=utf-8
from __future__ import absolute_import, print_function
import argparse

import torch
from torch.backends import cudnn
from evaluations import extract_features
import DataSet
import numpy as np
cudnn.benchmark = True

parser = argparse.ArgumentParser(description='PyTorch Testing')

parser.add_argument('-data', type=str, default='cub')
parser.add_argument('-r', type=str, default='model.pkl', metavar='PATH')

parser.add_argument('-test', type=int, default=1, help='evaluation on test set or train set')

args = parser.parse_args()
cudnn.benchmark = True

# model = inception_v3(dropout=0.5)
model = torch.load(args.r)
model = model.cuda()

temp = args.r.split('/')
name = temp[1] + '-' + temp[2]
if args.test == 1:
    print('test %s***%s' % (args.data, name))
    data = DataSet.create(args.data, train=False)
    data_loader = torch.utils.data.DataLoader(
        data.test, batch_size=64, shuffle=False, drop_last=False)
else:
    print('  train %s***%s' % (args.data, name))
    data = DataSet.create(args.data, test=False)
    data_loader = torch.utils.data.DataLoader(
        data.train, batch_size=8, shuffle=False, drop_last=False)

features, labels = extract_features(model, data_loader, print_freq=32, metric=None)
dim = len(features[0])
features = torch.cat(features)
features = features.numpy()
features = np.reshape(features, [-1, dim])
np.save('represent.npy', features)