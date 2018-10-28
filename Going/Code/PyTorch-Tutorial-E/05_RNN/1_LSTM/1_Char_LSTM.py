
# coding: utf-8

# # LSTM Practice
# 
# ![alt text](./LSTM.png)
# 
# ## 1. Settings
# 
# ### 1) Import Required Libraries

# In[1]:


import torch 
import torch.nn as nn
import torch.optim as optim
from torch.autograd import Variable
import numpy as np


# ### 2) Data & Preprocessing

# In[2]:


string = "hello pytorch. how long can a rnn cell remember? show me your limit!"
chars = "abcdefghijklmnopqrstuvwxyz ?!.,:;01"
char_list = [i for i in chars]
char_len = len(char_list)

char_len


# ### 3) Hyperparameters

# In[3]:


batch_size = 1
seq_len = 1
num_layers = 1
input_size = char_len
hidden_size = 35 
lr = 0.01
num_epochs = 1000


# ### 4) String to One-hot

# In[4]:


# String to onehot vector
# a -> [1 0 0 ... 0 0]

def string_to_onehot(string):
    start = np.zeros(shape=len(char_list) ,dtype=int)
    end = np.zeros(shape=len(char_list) ,dtype=int)
    start[-2] = 1
    end[-1] = 1
    for i in string:
        idx = char_list.index(i)
        zero = np.zeros(shape=char_len ,dtype=int)
        zero[idx]=1
        start = np.vstack([start,zero])
    output = np.vstack([start,end])
    return output


# ### 5) Onehot to String

# In[5]:


# Onehot vector to word
# [1 0 0 ... 0 0] -> a 

def onehot_to_word(onehot_1):
    onehot = torch.Tensor.numpy(onehot_1)
    return char_list[onehot.argmax()]


# ## 2. RNN class using LSTM
# 
# ![alt text](./lstm_ex.jpg)

# In[6]:


# RNN with 1 hidden layer

class RNN(nn.Module):
    def __init__(self, input_size, hidden_size,num_layers):
        super(RNN, self).__init__()
        
        self.input_size = input_size
        self.hidden_size = hidden_size
        self.num_layers = num_layers
        self.lstm = nn.LSTM(input_size,hidden_size,num_layers)
        
    def forward(self,input,hidden,cell):
        output,(hidden,cell) = self.lstm(input,(hidden,cell))
        
        return output,hidden,cell
    
    def init_hidden_cell(self):
        hidden = Variable(torch.zeros(num_layers,seq_len*batch_size,hidden_size))
        cell = Variable(torch.zeros(num_layers,seq_len*batch_size,hidden_size))
        
        return hidden,cell
    
rnn = RNN(input_size,hidden_size, num_layers)


# ## 3. Loss Function & Optimizer

# In[7]:


one_hot = torch.from_numpy(string_to_onehot(string)).type_as(torch.FloatTensor())
print(one_hot.size())

loss_func = nn.MSELoss()
optimizer = torch.optim.Adam(rnn.parameters(), lr=lr)


# ## 4. Test code

# In[8]:


j=0
input_data = Variable(one_hot[j:j+seq_len].view(batch_size,seq_len,-1))
print(input_data.size())

hidden,cell = rnn.init_hidden_cell()
print(hidden.size(),cell.size())

output, hidden,cell = rnn(input_data,hidden,cell)
print(output.size(),hidden.size(),cell.size())


# ## 5. Train

# In[9]:


unroll_len = one_hot.size()[0]//seq_len -1

for i in range(num_epochs):
    hidden,cell = rnn.init_hidden_cell()
    
    loss = 0
    for j in range(unroll_len):
        input_data = Variable(one_hot[j:j+seq_len].view(batch_size,seq_len,-1))
        label = Variable(one_hot[j+1:j+seq_len+1].view(batch_size,seq_len,-1))
        
        optimizer.zero_grad()
        
        output, hidden, cell = rnn(input_data,hidden,cell)
        loss += loss_func(output.view(1,-1),label.view(1,-1))
        
    loss.backward()
    optimizer.step()

    if i%10 ==0:
        print(loss)


# ## 6. Test

# In[10]:


hidden,cell = rnn.init_hidden_cell()

for j in range(unroll_len-1):
    input_data = Variable(one_hot[j:j+seq_len].view(batch_size,seq_len,-1))
    label = Variable(one_hot[j+1:j+seq_len+1].view(batch_size,seq_len,-1))
    
    output, hidden, cell = rnn(input_data,hidden,cell)
    print(onehot_to_word(output.data),end="") 
