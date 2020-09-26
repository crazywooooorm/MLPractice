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

## 8. What is principal component analysis? Explain the sort of problems you would use PCA for. Also explain its limitations as a method
* Principal component analysis (PCA) is the process of using an orthogonal transformation to convert a set of observations of correlated variables into a set of values of linearly uncorrelated variables (principal components)
* Dimension reduction
* PCA algorithm:
  * standardization: PCA is not scale invariant
  * calculate the covariance matrix
  * calculate the eigenvectors of covariance matrix
  * choose k principal components to cover x% (typically x = 99) variance
* Dimension reduction can only happen when variables are correlated, and the components might be hard to interpolate

## 9. What is collaborative filtering, n-grams, cosine distance?
* Collaborative filtering, used in recommender systems:
  * Memory based: calculate Euclidean or cosine distance between members or item, then predict scores based on history of similar members or items
  * Model based: before applying memory based method, using dimensionality reduction technique (SVD, PCA...) to compress the sparse matrix
* N-grams: a contiguous sequence of n items from a given sample of text or speech
* Cosine distance: calculate similarity between two vectors, cosine(A, B) = <A * B>/(|A| * |B|)
