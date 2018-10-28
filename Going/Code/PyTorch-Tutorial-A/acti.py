import torch
from torch.nn.modules.module import Module
from torch.autograd import Variable
import numpy as np 


class Relu(Module):

    def __init__(self, n=0.2):
        super(Relu, self).__init__()
        self.n = n

    def forward(self, input):
        positive_mask = (input > self.n).type_as(input)
        return input * positive_mask


class Abslu(Module):

    def forward(self, input):
        return input.abs()


class Squarelu(Module):

    def forward(self, input):
        return input * input


class Leakyrelu(Module):

    def __init__(self, negative_slope=1e-2):
        super(Leakyrelu, self).__init__()
        self.negative_slope = negative_slope

    def forward(self, input):
        positive_mask = (input > 0).type_as(input)
        negetive_mask = (input <= 0).type_as(input)
        return input * positive_mask + self.negative_slope * input * negetive_mask


# m = Relu()
# m = Abslu()
# m = Squarelu()
m = Leakyrelu()
x = np.array([-0.1])
input = Variable(torch.from_numpy(x), requires_grad=True)
print('Input:', input.data[0])
res = m(input, )
print('Output', res.data[0])
res.backward()
print('grad', input.grad.data[0])
