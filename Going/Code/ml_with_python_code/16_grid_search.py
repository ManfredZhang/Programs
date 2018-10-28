# Grid Search for Algorithm Tuning
import numpy
from pandas import read_csv
#from sklearn.linear_model import Ridge
from sklearn.svm import SVC
from sklearn.model_selection import GridSearchCV
from sklearn.model_selection import KFold
filename = 'pima-indians-diabetes.data.csv'
names = ['preg', 'plas', 'pres', 'skin', 'test', 'mass', 'pedi', 'age', 'class']
dataframe = read_csv(filename, names=names)
array = dataframe.values
X = array[:,0:8]
Y = array[:,8]
_gamma = numpy.array([1,0.1,0.01,0.001,0.0001])
_C=numpy.array([1.0,10,100])
_kernel=['linear','rbf']
param_grid = dict(gamma=_gamma,C=_C,kernel=_kernel)
# param_grid = dict(gamma=_gamma,C=_C)
model = SVC()
cv = KFold()
grid = GridSearchCV(estimator=model, param_grid=param_grid,verbose=1,cv=cv)
grid.fit(X,Y)
print(grid.best_score_)
print(grid.best_estimator_)
