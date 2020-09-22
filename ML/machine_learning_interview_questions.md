# Popular Machine Learning Interview Questions

## 1. What is cross-validation? How to do it right?
* The goal of cross-validation is to test the model's ability to predict new data that was not used in estimating it, in order to flag problems like **overfitting** or **selection bias**
* If we do leave-one-out cv, we will have very almost unbiased estimates (each trained set is basically same with whole training set) but with very high variance (each trained set is highly correlated). To get a good balance between bias and variance, typically pick 5 or 10 folds.

## 2. Is it better to design robust or accurate algorithms?
* If the model is too simple, the system can only capture the actual data regularities in a rough manner, which is said to suffer from underfitting
* If the model is too complex, the system can identify accidental patterns in the training data, which is said to be affected by overfitting
* The principle of Occam’s razor for avoiding overfitting: simpler models are preferred if more complex models do not significantly improve the quality of the description for the observations

## 3. How to define/select metrics?
* metrics in regression:
  * MAE (Mean Absolute Error)
  * MSE (Mean Squared Error): MSE weighs more on large error, which also makes it less robust to outlier than MAE.
* metrics in classification:
  * Recall, Precision, ROC/AUC, F1-Score

## 4. Explain what regularization is and why it is useful. What are the benefits and drawbacks of specific methods, such as ridge regression and lasso?
* Used to prevent overfitting and decrease model complexity
* Ridge: L2 penalty, penalizes sum of squared coefficients, reduces the value of coefficients but doesn't reduce to 0
* Lasso: L1 penalty, penalizes sum of absolute values of coefficients, can reduce coefficients to 0, so can be used for feature selection

## 5. Explain what a local optimum is and why it is important in a specific context, such as K-means clustering. What are specific ways of determining if you have a local optimum problem? What can be done to avoid local optima?
* A solution that is optimal in within a neighboring set of candidate solutions
* How to identify local optimum:
  * Tendency of premature convergence (converges too early)
  * Get different optima with different initializations

## 6. What is latent semantic indexing? What is it used for? What are the specific limitations of the method?
* Indexing and retrieval method that uses singular value decomposition to identify patterns in the relationships between the terms and concepts contained in an unstructured collection of text
* Based on the principle that words that are used in the same contexts tend to have similar meanings
* Often used in learning word meanings or [latent semantic analysis](https://www.asc.ohio-state.edu/reidy.16/LSAtutorial.pdf)

## 7. Explain what resampling methods are and why they are useful
* repeatedly drawing samples from a training set and refitting a model on each subset in order to obtain additional information about the fitted model
* Mostly commonly used in cross-validation (without replacement) and bootstrap (with replacement)
