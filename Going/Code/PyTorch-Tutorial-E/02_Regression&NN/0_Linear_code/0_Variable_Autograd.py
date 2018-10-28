
# coding: utf-8

# # Variable & Automatic Gradient Calculation
# - Tensor vs Variable
# - Graph and Gradient

# ## 1.Import Required Libraries

# In[1]:


import torch
from torch.autograd import Variable


# ## 2. Tensor vs Variable
# ### 1) Declaration

# In[2]:


x_tensor = torch.Tensor(3,4)
x_tensor


# In[3]:


x_variable = Variable(x_tensor)
x_variable


# ### 2) Variables of a Variable

# In[4]:


# .data -> wrapped tensor 
x_variable.data


# In[5]:


# .grad -> gradient of the variable
print(x_variable.grad)


# In[6]:


# .requires_grad -> whether variable requres gradient
print(x_variable.requires_grad)

x_variable = Variable(x_tensor,requires_grad=True)
x_variable.requires_grad


# In[7]:


# .volatile -> inference mode with minimal memory usage
# single volatile variable makes whole graph not requiring gradient

x_variable = Variable(x_tensor,volatile=True)
x_variable.grad, x_variable.requires_grad, x_variable.volatile


# ## 3. Graph & Variables

# In[8]:


# create graph

x = Variable(torch.FloatTensor(3,4),requires_grad=True)
y = x**2 + 4*x
z = 2*y +3

x.requires_grad,y.requires_grad,z.requires_grad


# In[9]:


# .backward(gradient,retain_graph,create_graph,retain_variables)
# compute gradient of current variable w.r.t. graph leaves

loss = torch.FloatTensor(3,4)
z.backward(loss)

print(x.grad)
y.grad,z.grad

