import numpy as np
from sklearn.svm import LinearSVC
from sklearn.model_selection import KFold
import csv
import pandas as pd
df = pd.read_csv("diabetes_scale.csv")
data = data.values
Train_X = data[1:500,2:]
Train_Y = data[1:500,1]
Test_X = data[501:,2:]
Test_Y = data[501:,1]
f = KFold(n_splits=5)
kf.get_n_splits(Train_X)
w, h = 20, 5
acc = [[0 for x in range(w)] for y in range(h)] 

#C_set = np.linspace(0.1, 2.0,num = 20)
i,j = 0,0
for c in np.linspace(0.1, 2.0, num = 20)
    i = i + 1
    for train_index, test_index in kf.split(X):
        j = j + 1
        X_train, X_test = Train_X[train_index], Train_X[test_index]
        y_train, y_test = Train_Y[train_index], Train_Y[test_index]
        clf = LinearSVC(C = c, loss='hinge', penalty='l1')
        clf.fit(X_train, y_train)
        result = clf.predict(X_test)
        acc[i,j] = np.sum(y_test == result)

print(acc)
