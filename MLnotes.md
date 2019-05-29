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
