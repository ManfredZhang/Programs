# -*- encoding: utf-8 -*-
import argparse
import torch
import torch.nn as nn
import torchvision.datasets as dsets
import random
import numpy as np
import time
import matplotlib.pyplot as plt

from contrastive import ContrastiveLoss
from torch.autograd import Variable
from torchvision import transforms
from model_02 import SiameseNetwork
#from net import SiameseNetwork

class Dataset(object):

    def __init__(self, x0, x1, label):
        self.size = label.shape[0]
        self.x0 = torch.from_numpy(x0)
        self.x1 = torch.from_numpy(x1)
        self.label = torch.from_numpy(label)

    def __getitem__(self, index):
        return (self.x0[index],
                self.x1[index],
                self.label[index])

    def __len__(self):
        return self.size


#def create_pairs(data, labels,n_samples=5000):
#    x0_data = []
#    x1_data = []
#    label = []

#    n = len(labels)
#    for i in range(n_samples):
#        indices = np.random.permutation(n)[:2]
#        x0 = data[indices[0]]
#        x1 = data[indices[1]]
#        l_0 = labels[indices[0]]
#        l_1 = labels[indices[1]]            
#        x0_data.append(x0 / 255)
#        x1_data.append(x1 / 255)
#        if l_0 == l_1:
#            label.append(1)
#        else:
#            label.append(0)       

#    x0_data = np.array(x0_data, dtype=np.float32)
#    x0_data = x0_data.reshape([-1, 1, 28, 28])
#    x1_data = np.array(x1_data, dtype=np.float32)
#    x1_data = x1_data.reshape([-1, 1, 28, 28])
#    label = np.array(label, dtype=np.int32)
#    return x0_data, x1_data, label

#def create_iterator(data, label,n_samples=5000):

#    x0, x1, label = create_pairs(data,label,n_samples=n_samples)
#    ret = Dataset(x0, x1, label)
#    return ret

def create_pairs(data, digit_indices,n_samples=500):
    x0_data = []
    x1_data = []
    label = []

    n = min([len(digit_indices[d]) for d in range(10)]) - 1
    for d in range(10):
        # make n pairs with each number
        for i in range(n_samples):
            # make pairs of the same class
            # label is 1
            indices = np.random.permutation(n)[:2]
            j,k = indices[0],indices[1]
            z1, z2 = digit_indices[d][j], digit_indices[d][k]
            # scale data to 0-1
            # XXX this does ToTensor also
            x0_data.append(data[z1] / 255)
            x1_data.append(data[z2] / 255)
            label.append(1)

            # make pairs of different classes
            # since the minimum value is 1, it is not the same class
            # label is 0
            inc = random.randrange(1, 10)
            dn = (d + inc) % 10            
            z1, z2 = digit_indices[d][j], digit_indices[dn][k]
            # scale data to 0-1
            # XXX this does ToTensor also
            x0_data.append(data[z1] / 255)
            x1_data.append(data[z2] / 255)
            label.append(0)

    x0_data = np.array(x0_data, dtype=np.float32)
    x0_data = x0_data.reshape([-1, 1, 28, 28])
    x1_data = np.array(x1_data, dtype=np.float32)
    x1_data = x1_data.reshape([-1, 1, 28, 28])
    label = np.array(label, dtype=np.int32)
    return x0_data, x1_data, label


def create_iterator(data, label, n_samples=500):
    digit_indices = [np.where(label == i)[0] for i in range(10)]
    x0, x1, label = create_pairs(data, digit_indices,n_samples=n_samples)
    indices = np.random.permutation(len(label))
    x0, x1, label = x0[indices],x1[indices],label[indices]
    ret = Dataset(x0, x1, label)
    return ret



def main():
   
    parser = argparse.ArgumentParser()
    parser.add_argument('--epoch', '-e', type=int, default=50,
                        help='Number of sweeps over the dataset to train')
    parser.add_argument('--lr', type=float, default=0.001,
                    help='initial learning rate [default: 0.001]')
    parser.add_argument('--momentum', type=float, default=0.85,help='momentum parameters')
    parser.add_argument('--weight-decay', type=float, default=1e-7,help='weight_decay parameters')
    parser.add_argument('--batch-size', '-b', type=int, default=128,
                        help='Number of images in each mini-batch')
    parser.add_argument('--out-dim', type=int, default=128,
                    help='out_dim')
    parser.add_argument('--n-samples', type=int, default=200,
                    help='out_dim')
    parser.add_argument('--n-steps', type=int, default=3,
                help='out_dim')
    parser.add_argument('--gamma', type=int, default=0.5,
            help='out_dim')
    parser.add_argument('--n-ways', type=int, default=5,
        help='way')
    parser.add_argument('--no-cuda', action='store_true', default=False,
                        help='disables CUDA training')
    parser.add_argument('--model', '-m', default='',
                        help='Give a model to test')
    parser.add_argument('--train-plot', action='store_true', default=False,
                        help='Plot train loss') 
    args = parser.parse_args()
    args.cuda = not args.no_cuda and torch.cuda.is_available()
    print("Args: %s" % args)

    # create pair dataset iterator
    train = dsets.MNIST(
        root='./data/mnist',
        train=True,
        transform=transforms.Compose([
                transforms.ToTensor(),
                #transforms.Normalize((0.1307,), (0.3081,))
            ]),
        download=True
    )
    test = dsets.MNIST(
        root='./data/mnist',
        train=False,
        # XXX ToTensor scale to 0-1
        transform=transforms.Compose([
            transforms.ToTensor(),
        #     transforms.Normalize((0.1307,), (0.3081,))
        ])
    )

    #train_iter = create_iterator(
    #    train.train_data.numpy(),
    #    train.train_labels.numpy(),
    #    n_samples=args.n_samples)
    train_iter = create_iterator(
    train.train_data.numpy(),
    train.train_labels.numpy(),n_samples=args.n_samples)
    # model
    model = SiameseNetwork(out_dim=args.out_dim)
    if args.cuda:
        model.cuda()


    # Loss and Optimizer
    criterion = ContrastiveLoss()

    #optimizer = torch.optim.SGD(model.parameters(), lr=args.lr,momentum=args.momentum,weight_decay=args.weight_decay)
    optimizer = torch.optim.Adam(model.parameters(), lr=args.lr,weight_decay=args.weight_decay)
    kwargs = {'num_workers': 0, 'pin_memory': True} if args.cuda else {}
    train_loader = torch.utils.data.DataLoader(
        train_iter,
        batch_size=args.batch_size, shuffle=True, **kwargs)

    test_loader = torch.utils.data.DataLoader(
        test,
        batch_size=args.batch_size, shuffle=True, **kwargs)

    
    def train(epoch):
        train_loss = []
        model.train()
        start = time.time()
        start_epoch = time.time()
        for batch_idx, (x0, x1, labels) in enumerate(train_loader):
            labels = labels.float()
            if args.cuda:
                x0, x1, labels = x0.cuda(), x1.cuda(), labels.cuda()
            x0, x1, labels = Variable(x0), Variable(x1), Variable(labels)
            output1, output2 = model(x0, x1)
            loss = criterion(output1, output2, labels)
            train_loss.append(loss.data[0])
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()
            if batch_idx % args.batch_size == 0:
                end = time.time()
                took = end - start
                print('Train Epoch: {} [{}/{} ({:.0f}%)]\tLoss: {:.6f}\tTook: {:.2f}'.format(
                    epoch, batch_idx * len(labels), len(train_loader.dataset),
                    100. * batch_idx / len(train_loader), loss.data[0], took))
                start = time.time()

        torch.save(model.state_dict(), './model-epoch-{}-{}-{}.pth' .format(epoch,args.n_samples,args.out_dim))
        end = time.time()
        took = end - start_epoch
        print('Train epoch: {} \tTook:{:.2f}'.format(epoch, took))
        return train_loss

    def test(model):
        model.eval()
        all = []
        all_labels = []

        for batch_idx, (x, labels) in enumerate(test_loader):
            if args.cuda:
                x, labels = x.cuda(), labels.cuda()
            x, labels = Variable(x, volatile=True), Variable(labels)
            output = model.forward_once(x)
            all.extend(output.data.cpu().numpy().tolist())
            all_labels.extend(labels.data.cpu().numpy().tolist())

        numpy_all = np.array(all)
        numpy_labels = np.array(all_labels)
        return numpy_all, numpy_labels

    def plot_mnist(numpy_all, numpy_labels):
        c = ['#ff0000', '#ffff00', '#00ff00', '#00ffff', '#0000ff',
                '#ff00ff', '#990000', '#999900', '#009900', '#009999']
        x_dim=0
        y_dim = 1 
        for i in range(10):
            f = numpy_all[np.where(numpy_labels == i)]
            plt.plot(f[:, x_dim], f[:, y_dim], '.', c=c[i])
        plt.legend(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'])
        plt.savefig('result.png')
        plt.show()

    if len(args.model) == 0:
        train_loss = []
        scheduler = torch.optim.lr_scheduler.StepLR(optimizer, step_size=args.n_steps, gamma=args.gamma)
        for epoch in range(1, args.epoch + 1):
            scheduler.step()
            train_loss.extend(train(epoch))

        if args.train_plot:
            plt.gca().cla()
            plt.plot(train_loss, label="train loss")
            plt.legend()
            plt.draw()
            plt.savefig('train_loss.png')
            plt.gca().clear()

    else:
        saved_model = torch.load(args.model)
        model = SiameseNetwork(out_dim=args.out_dim)
        model.load_state_dict(saved_model)
        if args.cuda:
            model.cuda()

    numpy_all, numpy_labels = test(model)
    plot_mnist(numpy_all, numpy_labels)


if __name__ == '__main__':
    main()
