# Ensemble Method

## Theory
Ensembles combine multiple hypotheses to form a (hopefully) better hypothesis. The term ensemble is usually reserved for methods that generate multiple hypotheses using the same base learner. Evaluating the prediction of an ensemble typically requires more computation than evaluating the prediction of a single model, so fast algorithms such as decision trees are commonly used in ensemble methods (for example, random forests), although slower algorithms can benefit from ensemble techniques as well.

Empirically, ensembles tend to yield better results when there is a significant diversity among the models. Many ensemble methods, therefore, seek to promote diversity among the models they combine.

## Common ensembles
### Bagging (bootstrap aggregating)
Bagging involves having each model in the ensemble vote with equal weight. In order to promote model variance, bagging trains each model in the ensemble using a randomly drawn subset (both on row and column) of the training set. As an example, the random forest algorithm combines random decision trees with bagging to achieve very high classification accuracy.

### Boosting
Boosting involves incrementally building an ensemble by training each new model instance to emphasize the training instances that previous models mis-classified. In some cases, boosting has been shown to yield better accuracy than bagging, but it also tends to be more likely to over-fit the training data. By far, the most common implementation of boosting is AdaBoost.

## Gradient boosting
Gradient boosting is similar to AdaBoost, the difference is AdaBoost updating iteration by giving more weight to falsely predicted points, while gradient boosting updating iteration by applying the gradient decent of loss function. Basically, gradient boosting is more flexible because it has options on loss function, AdaBoost can be treated as a special case of gradient boosting with an exponential loss function.   

## XGBoost
Essentially, [XGBoost](https://arxiv.org/pdf/1603.02754.pdf) is also using the gradient boosting technique, but it has some great features to make it have better performance and faster at the same time:
  * Sparsity-aware split finding: handle missing data by giving missing value a default direction. The default direction is decided by comparing the performance of model with putting missing values in different directions.
  * Weighted quantile sketch: A data structure that supports merge and prune operations on weighted data, so XGBoost can handle those falsely predicted points with larger weight from last iteration.
  * Better system design: Block structure for parallel learning, Cache awareness and Out-of-core computing helps XGBoost has a significant faster training speed than other ensemble algorithms.
