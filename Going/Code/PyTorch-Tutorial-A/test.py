import torch
a = torch.randn(5)
print(a)
b = a+2
print(b)

import numpy as np
a=np.array([1,2,3])
b=np.random.randn(3)

x = torch.from_numpy(b)
print(x.type)

y = torch.cos(x)
print(y)

 