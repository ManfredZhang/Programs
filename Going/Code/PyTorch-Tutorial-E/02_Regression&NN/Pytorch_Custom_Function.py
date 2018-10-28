
# coding: utf-8

# In[1]:


import torch
import torch.nn as nn
from torch.autograd import Variable, Function


# In[2]:


for i in Function.__dict__:
    print(i) # Function.__dict__[i]


# In[3]:


class Exp(Function):
    @staticmethod
    def forward(ctx, i):
        result = i.exp()
        ctx.save_for_backward(result)
        return result

    @staticmethod
    def backward(ctx, grad_output):
        result, = ctx.saved_variables
        return grad_output * result

layer = Exp().apply
print(layer)


# In[4]:


a = Variable(torch.Tensor([1,2]),requires_grad=True)
output = layer(a)
print(output)
result = torch.sum(output)
print(result)

print(a.grad)
result.backward()
print(a.grad)

