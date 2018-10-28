
# coding: utf-8

# # Embedding Practice
# 
# torch.nn.Embedding(num_embeddings, embedding_dim)
# 
# ## 1. Import Required Libraries

# In[ ]:


import torch
import torch.nn as nn
from torch.autograd import Variable


# ## 2. Prepare Data

# In[21]:


a = Variable(torch.LongTensor([0,0,0,1]))
b = Variable(torch.LongTensor([3]))

a_ = Variable(torch.LongTensor([[0,0,0,1],[1,0,0,0],[0,1,0,0],[0,0,1,0]]))
b_ = Variable(torch.LongTensor([3,0,1,2]))


# ## 3. Create Embedding Instance
# 
# Embedding을 사용하면 one-hot vector를 사용하지 않아도 됨

# In[23]:


embedder = nn.Embedding(num_embeddings=4,embedding_dim=5)

embedder(a).size(), embedder(b).size(), embedder(a_).size(), embedder(b_).size()

