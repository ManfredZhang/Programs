import _init_paths

import utils
from utils.misc import *
from scipy.stats.distributions import uniform



if __name__ == '__main__':
   
    param_grid = {'a': [1, 2], 'b': [True, False]}
    print(list(ParameterGrid(param_grid)))
    from scipy.stats.distributions import expon
    np.random.seed(0)
    param_grid = {'lr':[0.01,0.001,0.0025,0.005,0.0075,0.0001,0.00001],'momentum':uniform(0.15,0.7),'weight_decay':[1e-3,1e-5,1e-7]}
    param_list = list(ParameterSampler(param_grid, n_iter=50))
    for parm in param_list:
        print('lr=',parm['lr'],'momentum=',parm['momentum'],'weight_decay=',parm['weight_decay'])

    print('finished')