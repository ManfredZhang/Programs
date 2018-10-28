import torchvision
import torchvision.datasets as dset
import torchvision.transforms as transforms
import torch
from torch.autograd import Variable
from torch.utils.data import DataLoader,Dataset
import random
import os
from PIL import Image
import matplotlib.pyplot as plt
import numpy as np
from torch.utils.data.sampler import Sampler

def character_folders(data_folder):
    

    character_folders = [os.path.join(data_folder, family, character).replace('\\','/') \
                for family in os.listdir(data_folder) \
                if os.path.isdir(os.path.join(data_folder, family)) \
                for character in os.listdir(os.path.join(data_folder, family))]

    random.seed(1)
    random.shuffle(character_folders)


    return character_folders

class meta_datasets(object):

    def __init__(self, character_folders, num_classes, train_num_per_class=1,test_num_per_class=5,shuffle=True):

        self.character_folders = character_folders
        self.num_classes = num_classes
        self.train_num = train_num_per_class
        self.test_num = test_num_per_class

        class_folders = random.sample(self.character_folders,self.num_classes)
        labels = np.array(range(len(class_folders)))
        labels = dict(zip(class_folders, labels))
        samples = dict()

        self.train_roots = []
        self.test_roots = []
        for c in class_folders:

            temp = [os.path.join(c, x).replace('\\','/') for x in os.listdir(c)] #获取子类目录下的所有样本图像

            samples[c] = random.sample(temp, len(temp)) #随机打乱

            self.train_roots += samples[c][:self.train_num]

            self.test_roots += samples[c][self.train_num:self.train_num+self.test_num]


        self.train_labels = [labels[self.get_class(x)] for x in self.train_roots]
        self.test_labels = [labels[self.get_class(x)] for x in self.test_roots]
        #if shuffle:
            
        #    self.train_roots = np.array(self.train_roots)
        #    self.train_labels = np.array(self.train_labels,dtype=np.int32)
        #    indices = np.random.permutation(len(self.train_labels))
        #    self.train_roots = self.train_roots[indices]
        #    self.train_labels = self.train_labels[indices]

        #    self.test_roots = np.array(self.test_roots)
        #    self.test_labels = np.array(self.test_labels,dtype=np.int32)
        #    indices = np.random.permutation(len(self.test_labels))
        #    self.test_roots = self.test_roots[indices]
        #    self.test_labels = self.test_labels[indices]

    def get_class(self, sample):
        
        return os.path.join(*sample.split('/')[:-1]).replace('\\','/')
class _BaseDataset(Dataset):

    def __init__(self, meta_datasets, is_train=True, transform=None, target_transform=None):
        self.transform = transform # Torch operations on the input image
        self.target_transform = target_transform
        self.meta_datasets = meta_datasets
        self.is_train = is_train
        self.image_roots = self.meta_datasets.train_roots if self.is_train else self.meta_datasets.test_roots
        self.labels = self.meta_datasets.train_labels if self.is_train else self.meta_datasets.test_labels

    def __len__(self):
        return len(self.image_roots)

    def __getitem__(self, idx):
        raise NotImplementedError("This is an abstract class. Subclass this class for your particular dataset.")

class FewShotDatasets(_BaseDataset):

    def __init__(self, *args, **kwargs):
        super(FewShotDatasets, self).__init__(*args, **kwargs)

    def __getitem__(self, idx):
        image_root = self.image_roots[idx]
        image = Image.open(image_root)
        image = image.convert('L')
        image = image.resize((28,28), resample=Image.LANCZOS) # per Chelsea's implementation
        #image = np.array(image, dtype=np.float32)
        if self.transform is not None:
            image = self.transform(image)
        label = self.labels[idx]
        if self.target_transform is not None:
            label = self.target_transform(label)
        return image, label

class ClassBalancedSampler(Sampler):
    ''' Samples 'sampler_num_per_class' examples each from 'num_class' pools
        of examples of size 'num_per_class' '''

    def __init__(self, sampler_num_per_class, num_class, num_per_class,shuffle=True):
        self.sampler_num_per_class = sampler_num_per_class #每类采样多少样本
        self.num_class = num_class #多少类
        self.num_per_class = num_per_class #单个类的总样本数
        self.shuffle = shuffle

    def __iter__(self):
        # return a single list of indices, assuming that items will be grouped by class
        if self.shuffle:
            batch = [[i+j*self.num_per_class for i in torch.randperm(self.num_per_class)[:self.sampler_num_per_class]] for j in range(self.num_class)]
        else:
            batch = [[i+j*self.num_per_class for i in range(self.num_per_class)[:self.sampler_num_per_class]] for j in range(self.num_class)]
        batch = [item for sublist in batch for item in sublist]

        if self.shuffle:
            random.shuffle(batch)
        return iter(batch)

    def __len__(self):
        return 1

def get_data_loader(meta_ds, sampler_num_per_class=1, is_train=True,shuffle=True):
    # NOTE: batch size here is # instances PER CLASS
    normalize = transforms.Normalize(mean=[0.92206, 0.92206, 0.92206], std=[0.08426, 0.08426, 0.08426])

    dataset = FewShotDatasets(meta_ds,is_train=is_train,transform=transforms.Compose([transforms.ToTensor(),normalize]))

    if is_train:
        sampler = ClassBalancedSampler(sampler_num_per_class, meta_ds.num_classes, meta_ds.train_num,shuffle=shuffle)
    else:
        sampler = ClassBalancedSampler(sampler_num_per_class, meta_ds.num_classes, meta_ds.test_num,shuffle=shuffle)
    loader = DataLoader(dataset, batch_size=sampler_num_per_class*meta_ds.num_classes, sampler=sampler)

    return loader

if __name__ == '__main__':
    data_folder = './datas/omniglot_resized/'
    meta_character_folders = character_folders(data_folder)
    meta_ds = meta_datasets(meta_character_folders,num_classes=5,train_num_per_class=1,test_num_per_class=5)
    #fs_datasets= FewShotDatasets(meta_ds,transform=trans)
    train_loader = get_data_loader(meta_ds,sampler_num_per_class=1, is_train=True,shuffle=False)
    #test_loader = get_data_loader(meta_ds,sampler_num_per_class=5, is_train=False,shuffle=False)
    for i, data in enumerate(train_loader):
        x = Variable(data[0])
        y = Variable(data[1]).long()
    print('end')