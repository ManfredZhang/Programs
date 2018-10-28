
# coding: utf-8

# # Character Recurrent Neural Network
# - Mimicing Shakespeare's writing style
# - Long short-term memory(LSTM)
# 
# ![alt text](./LSTM.png)

# ## 1. Settings
# ### 1) Import required libraries

# In[1]:


import torch
import torch.nn as nn
from torch.autograd import Variable


# In[2]:


import unidecode
import string
import random
import re
import time, math


# ## 2) Hyperparameter

# In[3]:


num_epochs = 10000
print_every = 100
plot_every = 10
chunk_len = 200
embedding_size = 150
hidden_size = 100
batch_size =1
num_layers = 1
lr = 0.002


# ## 2. Data
# ### 1) Prepare characters

# In[4]:


all_characters = string.printable
n_characters = len(all_characters)
print(all_characters)
print('num_chars = ', n_characters)


# ### 2) Get text data

# In[5]:


file = unidecode.unidecode(open('./data/shakespeare.txt').read())
file_len = len(file)
print('file_len =', file_len)


# ## 3. Functions for text processing
# ### 1) Random Chunk

# In[6]:


def random_chunk():
    start_index = random.randint(0, file_len - chunk_len)
    end_index = start_index + chunk_len + 1
    return file[start_index:end_index]

print(random_chunk())


# ### 2) Character to tensor

# In[7]:


def char_tensor(string):
    tensor = torch.zeros(len(string)).long()
    for c in range(len(string)):
        tensor[c] = all_characters.index(string[c])
    return Variable(tensor)#.cuda()

print(char_tensor('ABCdef'))


# ### 3) Chunk into input & label

# In[8]:


def random_training_set():    
    chunk = random_chunk()
    inp = char_tensor(chunk[:-1])
    target = char_tensor(chunk[1:])
    return inp, target


# ## 3. Model & Optimizer
# 
# ![alt text](./lstm_ex.jpg)
# 
# ### 1) Model

# In[9]:


class RNN(nn.Module):
    def __init__(self, input_size, embedding_size, hidden_size, output_size, num_layers=1):
        super(RNN, self).__init__()
        self.input_size = input_size
        self.hidden_size = hidden_size
        self.output_size = output_size
        self.num_layers = num_layers
        self.embedding_size = embedding_size
        
        self.encoder = nn.Embedding(input_size, embedding_size)
        self.rnn = nn.LSTM(embedding_size,hidden_size,num_layers)
        self.decoder = nn.Linear(hidden_size, output_size)
        
    
    def forward(self, input, hidden,cell):
        out = self.encoder(input.view(batch_size,-1))
        out,(hidden,cell) = self.rnn(out,(hidden,cell))
        out = self.decoder(out.view(batch_size,-1))
        
        return out,hidden,cell

    def init_hidden(self):
          
        hidden = Variable(torch.zeros(num_layers,batch_size,hidden_size))#.cuda()
        cell = Variable(torch.zeros(num_layers,batch_size,hidden_size))#.cuda()
        
        return hidden,cell
    
model = RNN(n_characters, embedding_size, hidden_size, n_characters, num_layers)#.cuda()


# In[10]:


inp = char_tensor("A")
print(inp)
hidden,cell = model.init_hidden()
print(hidden.size())

out,hidden,cell = model(inp,hidden,cell)
print(out.size())


# ### 2) Loss & Optimizer

# In[11]:


optimizer = torch.optim.Adam(model.parameters(), lr=lr)
loss_func = nn.CrossEntropyLoss()


# ### 3) Test function

# In[12]:


def test():
    start_str = "b"
    inp = char_tensor(start_str)
    hidden,cell = model.init_hidden()
    x = inp

    print(start_str,end="")
    for i in range(200):
        output,hidden,cell = model(x,hidden,cell)

        output_dist = output.data.view(-1).div(0.8).exp()
        top_i = torch.multinomial(output_dist, 1)[0]
        predicted_char = all_characters[top_i]

        print(predicted_char,end="")

        x = char_tensor(predicted_char)


# ## 4. Train

# In[13]:


for i in range(num_epochs):
    total = char_tensor(random_chunk())
    inp = total[:-1]
    label = total[1:]
    hidden,cell = model.init_hidden()

    loss = 0
    optimizer.zero_grad()
    for j in range(chunk_len-1):
        x  = inp[j]
        y_ = label[j]
        y,hidden,cell = model(x,hidden,cell)
        loss += loss_func(y,y_)

    loss.backward()
    optimizer.step()
    
    if i % 100 == 0:
        print("\n",loss/chunk_len,"\n")
        test()
        print("\n\n")

