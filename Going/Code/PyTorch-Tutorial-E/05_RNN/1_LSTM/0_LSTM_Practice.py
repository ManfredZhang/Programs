
# coding: utf-8

# # LSTM Practice
# ## 1) Import required libraries

# In[1]:


import torch
import torch.nn as nn
from torch.autograd import Variable


# ### 2) Example

# In[2]:


rnn = nn.LSTM(3, 4, 2) # input_size, hidden_size, num_layers
input = Variable(torch.randn(5, 1, 3)) # seq_len(timestamp), batch, input_size
h0 = Variable(torch.randn(2, 1, 4)) # num_layers * num_directions, batch, hidden_size
c0 = Variable(torch.randn(2, 1, 4)) # num_layers * num_directions, batch, hidden_size
output, (hidden,cell) = rnn(input, (h0, c0))

input.size(),output.size(), hidden.size(), cell.size()


# ### 3) Batch First

# In[3]:


rnn = nn.LSTM(3, 5, 2, batch_first=True)
input = Variable(torch.randn(4, 1, 3)) # batch, seq_len, hidden_size
h0 = Variable(torch.randn(2, 4, 5))
c0 = Variable(torch.randn(2, 4, 5))
output, (hidden, cell) = rnn(input, (h0, c0))

input.size(),output.size(), hidden.size(), cell.size()


# ### 4) Using Parameters

# In[4]:


batch_size = 3
input_size = 7
hidden_size = 4
seq_len = 5
num_layers = 2

rnn = nn.LSTM(input_size, hidden_size, num_layers, batch_first=True)
input = Variable(torch.randn(batch_size, seq_len, input_size))
h0 = Variable(torch.randn(num_layers, batch_size, hidden_size))
c0 = Variable(torch.randn(num_layers, batch_size, hidden_size))
output, (hidden, cell) = rnn(input, (h0, c0))

input.size(),output.size(),hidden.size(), cell.size()

