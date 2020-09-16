# Popular Machine Learning Interview Questions

## 1. What is cross-validation? How to do it right?
* The goal of cross-validation is to test the model's ability to predict new data that was not used in estimating it, in order to flag problems like **overfitting** or **selection bias**
* If we do leave-one-out cv, we will have very almost unbiased estimates (each trained set is basically same with whole training set) but with very high variance (each trained set is highly correlated). To get a good balance between bias and variance, typically pick 5 or 10 folds. 
