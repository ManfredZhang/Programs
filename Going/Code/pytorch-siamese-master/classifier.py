# -*- encoding: utf-8 -*-

"""
=====================
Classifier comparison
=====================
"""

import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier
from sklearn.svm import SVC
from sklearn.gaussian_process.kernels import RBF
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier, AdaBoostClassifier,BaggingClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.linear_model import LogisticRegression
import pandas as pd
from sklearn.metrics import classification_report

def shuffle(data,batch_size):
    perm_indices = np.random.permutation(len(data))[:batch_size]
    return data[perm_indices]

names = [
        "Nearest Neighbors", 
        "Linear SVM",
        #"Decision Tree", 
        "Random Forest", 
        #"Bagging Classifer", 
        #"AdaBoost",
         #"Logistic Regression"
         ]

classifiers = [
    KNeighborsClassifier(5),
    SVC(kernel="linear", C=0.05),
    #DecisionTreeClassifier(max_depth=5),
    RandomForestClassifier(max_depth=8, n_estimators=200, max_features=1),
    #BaggingClassifier(base_estimator = DecisionTreeClassifier(criterion="entropy", min_samples_leaf = 10),  n_estimators=100),
    #AdaBoostClassifier(n_estimators=100),
    #LogisticRegression( C= 0.2)
]
#n_samples = 100
n_samples=200
out_dim = 128
filename = 'train_data_{}-{}-all.csv'.format(n_samples,out_dim)
data = pd.read_csv(filename)
print(data.head())
print(data.shape)
n_trains = 2000
train_set = np.array(data.values[:n_trains,:-1]).astype(float), np.array(data.values[:n_trains,-1]).astype(int)


datasets = [train_set]

filename = 'test_data_{}-{}-all.csv'.format(n_samples,out_dim)
data = pd.read_csv(filename)
print(data.head())
print(data.shape)
test_set = np.array(data.values[:,:-1]).astype(float), np.array(data.values[:,-1]).astype(int)

# iterate over datasets
for ds_cnt, ds in enumerate(datasets):
    # preprocess dataset, split into training and test part
    X, y = ds
    X = StandardScaler().fit_transform(X)
    X_train,y_train = X,y
    X, y = test_set
    X  = StandardScaler().fit_transform(X)
    X_test,y_test = X,y

   
    # iterate over classifiers
    for name, clf in zip(names, classifiers):

        clf.fit(X_train, y_train)
        y_predict = clf.predict(X_test)
        score = clf.score(X_test, y_test)
        print(name,score)
        print( classification_report(y_test, y_predict) )


