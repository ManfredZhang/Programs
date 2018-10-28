
# coding: utf-8

# # Framework Comparison
# 
# - Numpy vs Tensorflow vs PyTorch
# - output = x * y + z
# 

# In[4]:


import numpy as np
from datetime import datetime
start = datetime.now()

np.random.seed(0)

N,D = 3,4

x = np.random.randn(N,D)
y = np.random.randn(N,D)
z = np.random.randn(N,D)

a = x * y
b = a + z
c = np.sum(b)

grad_c = 1.0
grad_b = grad_c * np.ones((N,D))
grad_a = grad_b.copy()
grad_z = grad_b.copy()
grad_y = grad_a * y
grad_x = grad_a * x

print(grad_x)
print(grad_y)
print(grad_z)
print(datetime.now()-start)


# In[5]:


import tensorflow as tf
import numpy as np
from datetime import datetime
start = datetime.now()

with tf.device('/gpu:0'):
    x = tf.placeholder(tf.float32)
    y = tf.placeholder(tf.float32)
    z = tf.placeholder(tf.float32)

    a = x * y
    b = a + z
    c = tf.reduce_sum(b)
    
grad_x, grad_y, grad_z = tf.gradients(c,[x,y,z])

with tf.Session() as sess:
    values = {
        x: np.random.randn(N,D),
        y: np.random.randn(N,D),
        z: np.random.randn(N,D)           
    }
    out = sess.run([c,grad_x,grad_y,grad_z],feed_dict = values)
    c_val, grad_x_val, grad_y_val, grad_z_val = out

print(grad_x_val)
print(grad_y_val)
print(grad_z_val)
print(datetime.now()-start)


# In[6]:


import torch
from torch.autograd import Variable
from datetime import datetime
start = datetime.now()

N,D = 3,4

x = Variable(torch.randn(N,D).cuda(),requires_grad=True)
y = Variable(torch.randn(N,D).cuda(),requires_grad=True)
z = Variable(torch.randn(N,D).cuda(),requires_grad=True)

a = x * y
b = a + z
c = torch.sum(b)

c.backward(gradient=torch.cuda.FloatTensor([1.0]))

print(x.grad)
print(y.grad)
print(z.grad)
print(datetime.now()-start)

