# Some points need to be thought about in ML

## Feature Engineering:
* Bracket the numeric features so they become categorical and the model will
perform better if that feature actually has a non-linear correlation.

## Missing Data
* Think about where the missing data came from
* Missing itself can be a feature
* Remove row
* Inputation with mean or mode
* Algorithms ignoring missing values: KNN, decision tree. But the existing
funcions or packages might not support that.
* Bagging (Bootstrap aggregating) for small sample size
* Random forests might be a good method because features are selected and are
robust to missing values


## Sparse Data
* Matrix factorization

## Imbalanced Data
* Resampling
* SMOTE: Synthetic Minority Over-sampling Technique
* Change the evaluation rule: confusion matrix and F1 score
(F1 score is 2*precision*recall/(precision+recall), precision is tp/(tp+fp),
recall is tp/(tp+fn))
* Decision tree

## Dimension Reduction
* Penalty, LASSO/Ridge, AIC/BIC
* PCA, factor analysis, non-negative matrix factorization
* Just remove

## Error analysis
* In a ml modeling case, typically we split our training data to training set and training-dev set, split our test data to dev set and test set. Now we have 5 different error types: Human error, training error, training-dev error, dev error and test error. The gap between those errors reflect different problems:
  * Gap between human error and training error is avoidable error
  * Gap between training error and training-dev error reflects the variance of the model, since training set and training-dev set are basically from the same distribution
  * Gap between training-dev error and dev error reflects the mismatch of the data, which means the distribution of training and test data are different
  * Gap between dev error and test error reflects the overfitting problem

* Transfer learning is used when you have different purposes and don't want to train the whole model again. Typically you can just change the last few layers to adjust to another purpose (e.g. another classification goal). Usually you have to make sure these models have the same input, or one model wouldn't be applied to another one (e.g. you can't use animal images to train a radiation model).

* End-to-end processing: typically this is discussed when it comes to deep learning since deep learning model can creates its own features on different layers. The end-to-end processing is basically just apply deep learning model on the raw data without creating some hand-designed features from raw data. It gives more freedom to the model itself but we can't guarantee it works as well as those hand-designed features. Also typically it demands much larger size of data to learn features like your hand-designed features.


## Follow Andrew Ng Machine Learning course to have a comprehensive review
[Andrew Ng Machine Learning](https://www.youtube.com/playlist?list=PLLssT5z_DsK-h9vYZkQkYNWcItqhlRJLN)


## Q&A Insights
* Cross-validation is a way to avoid overfitting, and to find a balance between bias and variance, we need to have a good choice of K for k-fold cv. Typically 5 or 10 are good. If we do leave-one-out cv, we will have very unbiased estimates but with very high variance.

* MSE weighs more on large error, which also makes it less robust to outlier than MAE.

* How to tell if a solution is local optimum? If you saw a tendency of premature convergence (converges too early), or get different optima with different initializations, you might have a local optimum.

* PCA is not scale invariant, so the data needs to be standardized first. With the covariance matrix of input data, we can calculate the eigenvectors of it and use a specific number of components to represent the original data. The pros is PCA can be used to dimension reduction or unsupervised learning, while the cons is dimension reduction can only happen when variables are correlated, and the components might be hard to interpolate.

* When we care more about positive, then false positive is more important than false negative, which means we care more about precision; If we care more about negative, then false negative is more important than false positive, which means we care more about recall.  
ROC
