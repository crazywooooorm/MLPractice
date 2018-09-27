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
