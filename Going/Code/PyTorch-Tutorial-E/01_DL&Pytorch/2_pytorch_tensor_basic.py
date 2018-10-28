
# coding: utf-8

# # PyTorch Tensor Basic Usage
# 
# - Create Tensor
# - Indexing,Joining,Slicing
# - Initialization
# - Math Operations

# ## 1. Create Tensor
# ### 1) random numbers

# In[1]:


import torch

# torch.rand(sizes) -> [0,1)
x = torch.rand(2,3)
print(x)


# In[2]:


# torch.randn(sizes) -> Z(0,1)
x = torch.randn(2,3)
print(x)



# In[3]:


# torch.randperm(n) -> permutation of 0~n
x = torch.randperm(5)
print(x)


# ### 2) zeros, ones, arange

# In[4]:


# torch.zeros(2,3) -> [[0,0,0],[0,0,0]]
x = torch.zeros(2,3)
print(x)


# In[5]:


# torch.ones(2,3) -> [[0,0,0],[0,0,0]]
x = torch.ones(2,3)
print(x)


# In[6]:


# torch.arange(start,end,step=1) -> [start,end) with step
x = torch.arange(0,3,step=0.5)
print(x)


# ### 3) Tensor Data Type

# In[7]:


# torch.FloatTensor(size or list)
x = torch.FloatTensor(2,3)
print(x)


# In[8]:


# torch.FloatTensor(size or list)
x = torch.FloatTensor([2,3])
print(x)


# In[9]:


# tensor.type_as(tensor_type)
x = x.type_as(torch.IntTensor())
print(x)


# ### 4) Numpy to Tensor, Tensor to Numpy

# In[10]:


import numpy as np

# torch.from_numpy(ndarray) -> tensor

x1 = np.ndarray(shape=(2,3), dtype=int,buffer=np.array([1,2,3,4,5,6]))
x2 = torch.from_numpy(x1)

print(x2)

# In[11]:


# tensor.numpy() -> ndarray
x3 = x2.numpy()
print(x3)


# ### 5) Tensor on CPU & GPU

# In[12]:


x = torch.FloatTensor([[1,2,3],[4,5,6]])
print(x)


# In[13]:

if torch.cuda.is_available():
    x_gpu = x.cuda()
    print(x_gpu)


# In[14]:

if isinstance(x_gpu,torch.cuda.FloatTensor):
    x_cpu = x_gpu.cpu()
    print(x_cpu)


# ### 6) Tensor Size

# In[15]:


# tensor.size() -> indexing also possible

x = torch.FloatTensor(10,12,3,3)

print(x.size()[:])


# ## 2. Indexing, Slicing, Joining
# ### 1) Indexing

# In[16]:


# torch.index_select(input, dim, index)

x = torch.rand(4,3)
out = torch.index_select(x,0,torch.LongTensor([0,3]))

print(x,out)


# In[17]:


# pythonic indexing also works

print(x[:,0],x[0,:],x[0:2,0:2])


# In[18]:


# torch.masked_select(input, mask)

x = torch.randn(2,3)
mask = torch.ByteTensor([[0,0,1],[0,1,0]])
out = torch.masked_select(x,mask)

print(x, mask, out)


# ### 2) Joining

# In[19]:


# torch.cat(seq, dim=0) -> concatenate tensor along dim

x = torch.FloatTensor([[1,2,3],[4,5,6]])
y = torch.FloatTensor([[-1,-2,-3],[-4,-5,-6]])
z1 = torch.cat([x,y],dim=0)
z2 = torch.cat([x,y],dim=1)

print(x,y,z1,z2)


# In[20]:


# torch.stack(sequence,dim=0) -> stack along new dim

x = torch.FloatTensor([[1,2,3],[4,5,6]])
x_stack = torch.stack([x,x,x,x],dim=0)

print(x_stack)


# ### 3) Slicing

# In[21]:


# torch.chunk(tensor, chunks, dim=0) -> tensor into num chunks

x_1, x_2 = torch.chunk(z1,2,dim=0)
y_1, y_2, y_3 = torch.chunk(z1,3,dim=1)

print(z1,x_1,x_2,z1,y_1,y_2,y_3)


# In[22]:


# torch.split(tensor,split_size,dim=0) -> split into specific size

x1,x2 = torch.split(z1,2,dim=0)
y1 = torch.split(z1,2,dim=1) 

print(z1,x1,x2,y1)


# ### 4) squeezing

# In[23]:


# torch.squeeze(input,dim=None) -> reduce dim by 1

x1 = torch.FloatTensor(10,1,3,1,4)
x2 = torch.squeeze(x1)

print(x1.size(),x2.size())


# In[24]:


# torch.unsqueeze(input,dim=None) -> add dim by 1

x1 = torch.FloatTensor(10,3,4)
x2 = torch.unsqueeze(x1,dim=0)

print(x1.size(),x2.size())


# ## 3. Initialization

# In[25]:


import torch.nn.init as init

x1 = init.uniform(torch.FloatTensor(3,4),a=0,b=9) 
x2 = init.normal(torch.FloatTensor(3,4),std=0.2)
x3 = init.constant(torch.FloatTensor(3,4),3.1415)

print(x1,x2,x3)


# ## 4. Math Operations
# ### 1) Arithmetic operations

# In[26]:


# torch.add()

x1 = torch.FloatTensor([[1,2,3],[4,5,6]])
x2 = torch.FloatTensor([[1,2,3],[4,5,6]])
add = torch.add(x1,x2)

print(x1,x2,add,x1+x2,x1-x2)


# In[27]:


# torch.add() broadcasting

x1 = torch.FloatTensor([[1,2,3],[4,5,6]])
x2 = torch.add(x1,10)

print(x1,x2,x1+10,x2-10)


# In[28]:


# torch.mul() -> size better match

x1 = torch.FloatTensor([[1,2,3],[4,5,6]])
x2 = torch.FloatTensor([[1,2,3],[4,5,6]])
x3 = torch.mul(x1,x2)

print(x3)


# In[29]:


# torch.mul() -> broadcasting

x1 = torch.FloatTensor([[1,2,3],[4,5,6]])
x2 = x1*10

print(x2)


# In[30]:


# torch.div() -> size better match

x1 = torch.FloatTensor([[1,2,3],[4,5,6]])
x2 = torch.FloatTensor([[1,2,3],[4,5,6]])
x3 = torch.div(x1,x2)

print(x3)


# In[31]:


# torch.div() -> broadcasting

x1 = torch.FloatTensor([[1,2,3],[4,5,6]])

print(x1/5)


# ### 2) Other Math Operations

# In[32]:


# torch.pow(input,exponent)

x1 = torch.FloatTensor(3,4)
print(torch.pow(x1,2),x1**2)


# In[33]:


# torch.exp(tensor,out=None) 

x1 = torch.FloatTensor(3,4)
print(torch.exp(x1))


# In[34]:


# torch.log(input, out=None) -> natural logarithm

x1 = torch.FloatTensor(3,4)
print(torch.log(x1))


# ### 3) Matrix operations

# In[35]:


# torch.mm(mat1, mat2) -> matrix multiplication

x1 = torch.FloatTensor(3,4)
x2 = torch.FloatTensor(4,5)

print(torch.mm(x1,x2))


# In[36]:


# torch.bmm(batch1, batch2) -> batch matrix multiplication

x1 = torch.FloatTensor(10,3,4)
x2 = torch.FloatTensor(10,4,5)

print(torch.bmm(x1,x2).size())


# In[37]:


# torch.dot(tensor1,tensor2) -> dot product of two tensor

x1 = torch.FloatTensor(3,4)
x2 = torch.FloatTensor(3,4)

print(torch.dot(x1,x2))


# In[38]:


# torch.t(matrix) -> transposed matrix

x1 = torch.FloatTensor(3,4)

print(x1,x1.t())


# In[39]:


# torch.transpose(input,dim0,dim1) -> transposed matrix

x1 = torch.FloatTensor(10,3,4)

print(x1.size(), torch.transpose(x1,1,2).size(), x1.transpose(1,2).size())


# In[40]:


# torch.eig(a,eigenvectors=False) -> eigen_value, eigen_vector

x1 = torch.FloatTensor(4,4)

print(x1,torch.eig(x1,True))

