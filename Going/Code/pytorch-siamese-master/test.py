# -*- encoding: utf-8 -*-
import random
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

axis=0
a = np.arange(8).reshape(4,2)
b = np.arange(4).reshape(4,1)
c=np.concatenate((a, b), axis=1)
#d=np.stack((a, b), axis=axis)
print(c)

