
# coding: utf-8

# # Visdom Tutorial
# 
# - text
# - image
# - scatter plot
# - bar plot
# - Contour & Surface Plot
# - Line Plot
# - Pie Chart Plot

# In[1]:


from visdom import Visdom
import numpy as np
import math
import os.path

viz = Visdom()


# ## Text Window

# In[2]:


textwindow = viz.text("Hello Pytorch")


# ## Image Window

# In[3]:


image_window = viz.image(
    np.random.rand(3,256,256),
    opts=dict(
        title = "random",
        caption = "random noise"
    )
)


# In[4]:


images_window = viz.images(
    np.random.rand(10,3,64,64),
    opts=dict(
        title = "random",
        caption = "random noise"
    )
)


# ## 2D Scatter Plot

# In[5]:


Y = np.random.rand(100)
scatter_window=viz.scatter(
            X=np.random.rand(100, 2),
            Y=(Y+1.5).astype(int),
            opts=dict(
                legend=['Apples', 'Pears'],
                xtickmin=0,
                xtickmax=2,
                xtickstep=0.5,
                ytickmin=0,
                ytickmax=2,
                ytickstep=0.5,
                markersymbol='cross-thin-open',
            ),
)


# ### Update Scatter Plot

# In[6]:


viz.updateTrace(
    X=np.random.rand(50),
    Y=np.random.rand(50),
    win=scatter_window,
    name='bananas',
)


# ## 3D Scatter Plot

# In[7]:


viz.scatter(
    X=np.random.rand(100, 3),
    Y=(Y + 1.5).astype(int),
    opts=dict(
        legend=['Men', 'Women'],
        markersize=5,
    )
)


# ## Bar Plot

# In[8]:


viz.bar(X=np.random.rand(20))


# ## Stacked Bar Plot

# In[9]:


viz.bar(
    X=np.abs(np.random.rand(5, 3)),
    opts=dict(
        stacked=True,
        legend=['Facebook', 'Google', 'Twitter'],
        rownames=['2012', '2013', '2014', '2015', '2016']
    )
)


# ## Unstacked Bar Plot

# In[10]:


viz.bar(
    X=np.random.rand(10, 3),
    opts=dict(
        stacked=False,
        legend=['The Netherlands', 'France', 'United States']
    )
)


# ## Contour Map & Surface

# In[11]:


x = np.tile(np.arange(1, 101), (100, 1))
y = x.transpose()
X = np.exp((((x - 50) ** 2) + ((y - 50) ** 2)) / -(20.0 ** 2))

# contour
viz.contour(X=X, opts=dict(colormap='Viridis'))

# surface
viz.surf(X=X, opts=dict(colormap='Hot'))


# ## Line Plot

# In[12]:


viz.line(Y=np.random.rand(10))


# ## Update Line Plot

# In[13]:


# line updates
win = viz.line(
    X=np.column_stack((np.arange(0, 10), np.arange(0, 10))),
    Y=np.column_stack((np.linspace(5, 10, 10), np.linspace(5, 10, 10) + 5)),
)

viz.line(
    X=np.column_stack((np.arange(10, 20), np.arange(10, 20))),
    Y=np.column_stack((np.linspace(5, 10, 10), np.linspace(5, 10, 10) + 5)),
    win=win,
    update='append'
)


# ## Pie Chart

# In[14]:


# pie chart
X = np.asarray([19, 26, 55])
viz.pie(
    X=X,
    opts=dict(legend=['Residential', 'Non-Residential', 'Utility'])
)


# ## With PyTorch Tensors

# In[15]:


# PyTorch tensor
try:
    import torch
    viz.line(Y=torch.Tensor([[0., 0.], [1., 1.]]))
except ImportError:
    print('Skipped PyTorch example')

