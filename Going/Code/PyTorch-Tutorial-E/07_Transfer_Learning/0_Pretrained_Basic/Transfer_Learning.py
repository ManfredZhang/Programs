
# coding: utf-8

# # Transfer Learning
# - Pretrained ResNet50
# - Custom dataset
# - Add fully connected layer 

# ## 1. Settings
# ### 1) Import required libraries

# In[1]:


import torch
import torch.nn as nn
import torch.optim as optim
import torchvision.models as models
import torchvision.datasets as dset
import torchvision.transforms as transforms
from torch.utils.data import DataLoader
from torch.autograd import Variable
import matplotlib.pyplot as plt


# ### 2) Hyperparameters

# In[2]:


batch_size = 6
learning_rate = 0.001
epoch = 50
num_category = 2


# ## 2. Data
# ### 1) Load images from folder

# In[3]:


# Input pipeline from a folder containing multiple folders of images
# we can check the classes, class_to_idx, and filename with idx

img_dir = "./images"
img_data = dset.ImageFolder(img_dir, transforms.Compose([
            transforms.RandomSizedCrop(224),
            transforms.RandomHorizontalFlip(),
            transforms.ToTensor(),
            ]))

print(img_data.classes)
print(img_data.class_to_idx)
print(img_data.imgs)


# ### 2) Set data loader

# In[4]:


# After we get the list of images, we can turn the list into batches of images
# with torch.utils.data.DataLoader()

img_batch = DataLoader(img_data, batch_size=batch_size,
                            shuffle=True, num_workers=2)

for img,label in img_batch:
    print(img.size())
    print(label)


# ## 3. Model & Optimizer
# ### 1) ResNet

# In[5]:


# https://discuss.pytorch.org/t/module-children-vs-module-modules/4551
# children() -> immediate children modules 
# modules() -> iterate all modules

resnet = models.resnet50(pretrained=True)

for name,module in resnet.named_children():
    print(name)


# ### 2) Fully Connected Model

# In[6]:


class Resnet(nn.Module):
    def __init__(self):
        super(Resnet,self).__init__()
        self.layer0 = nn.Sequential(*list(resnet.children())[0:-1])
        self.layer1 = nn.Sequential(
            nn.Linear(2048,500),
            nn.BatchNorm1d(500),
            nn.ReLU(),
            nn.Linear(500,num_category),
            nn.ReLU()
        )
        
    def forward(self,x):
        out = self.layer0(x)
        out = out.view(batch_size,-1)
        out= self.layer1(out)
        
        return out


# ### 3) Model on GPU

# In[7]:


model = Resnet().cuda()

for params in model.layer0.parameters():
    params.require_grad = False
    
for params in model.layer1.parameters():
    params.requires_grad = True


# In[8]:


for name in model.children():
    print(name)


# ### 4) Loss & Optimizer

# In[9]:


# define loss func & optimizer
# model.parameters() also works because of the cell right above

loss_func = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.layer1.parameters(),lr=learning_rate) 


# ## 4. Train

# In[12]:


for i in range(epoch):
    for img,label in img_batch:
        img = Variable(img).cuda()
        label = Variable(label).cuda()

        optimizer.zero_grad()
        output = model(img)
        loss = loss_func(output,label)
        loss.backward()
        optimizer.step()

    if i % 10 ==0:
        print(loss)


# ## 6. Test

# In[13]:


model.eval()
correct = 0
total = 0

for img,label in img_batch:
    img = Variable(img).cuda()
    label = Variable(label).cuda()
    
    output = model(img)
    _, pred = torch.max(output.data,1)
    
    total += label.size(0)
    correct += (pred == label.data).sum()   

print("Accuracy: {}".format(correct/total))

