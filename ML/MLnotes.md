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

## Ensemble Method
### Theory
Ensembles combine multiple hypotheses to form a (hopefully) better hypothesis. The term ensemble is usually reserved for methods that generate multiple hypotheses using the same base learner. Evaluating the prediction of an ensemble typically requires more computation than evaluating the prediction of a single model, so fast algorithms such as decision trees are commonly used in ensemble methods (for example, random forests), although slower algorithms can benefit from ensemble techniques as well.

Empirically, ensembles tend to yield better results when there is a significant diversity among the models. Many ensemble methods, therefore, seek to promote diversity among the models they combine.

### Bagging (bootstrap aggregating)
Bagging involves having each model in the ensemble vote with equal weight. In order to promote model variance, bagging trains each model in the ensemble using a randomly drawn subset (both on row and column) of the training set. As an example, the random forest algorithm combines random decision trees with bagging to achieve very high classification accuracy.

### Boosting
Boosting involves incrementally building an ensemble by training each new model instance to emphasize the training instances that previous models mis-classified. In some cases, boosting has been shown to yield better accuracy than bagging, but it also tends to be more likely to over-fit the training data. By far, the most common implementation of boosting is AdaBoost.

### Gradient boosting
Gradient boosting is similar to AdaBoost, the difference is AdaBoost updating iteration by giving more weight to falsely predicted points, while gradient boosting updating iteration by applying the gradient decent of loss function. Basically, gradient boosting is more flexible because it has options on loss function, AdaBoost can be treated as a special case of gradient boosting with an exponential loss function.   

### XGBoost
Essentially, [XGBoost](https://arxiv.org/pdf/1603.02754.pdf) is also using the gradient boosting technique, but it has some great features to make it have better performance and faster at the same time:
  * Sparsity-aware split finding: handle missing data by giving missing value a default direction. The default direction is decided by comparing the performance of model with putting missing values in different directions.
  * Weighted quantile sketch: A data structure that supports merge and prune operations on weighted data, so XGBoost can handle those falsely predicted points with larger weight from last iteration.
  * Better system design: Block structure for parallel learning, Cache awareness and Out-of-core computing helps XGBoost has a significant faster training speed than other ensemble algorithms.


## Follow Andrew Ng Machine Learning course to have a comprehensive review
[Andrew Ng Machine Learning](https://www.youtube.com/playlist?list=PLLssT5z_DsK-h9vYZkQkYNWcItqhlRJLN)


## Q&A Insights
* MSE weighs more on large error, which also makes it less robust to outlier than MAE.

* How to tell if a solution is local optimum? If you saw a tendency of premature convergence (converges too early), or get different optima with different initializations, you might have a local optimum.

* PCA is not scale invariant, so the data needs to be standardized first. With the covariance matrix of input data, we can calculate the eigenvectors of it and use a specific number of components to represent the original data. The pros is PCA can be used to dimension reduction or unsupervised learning, while the cons is dimension reduction can only happen when variables are correlated, and the components might be hard to interpolate.

* When we care more about positive, then false positive is more important than false negative, which means we care more about precision; If we care more about negative, then false negative is more important than false positive, which means we care more about recall.  
ROC
