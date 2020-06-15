# Basic ML
This markdown is a review for basic ML knowledge. The structure follows syllabus of Andrew Ng's CS229 course. Notes of this course can be found at http://cs229.stanford.edu/notes/.

## Gradient Descent
* Gradient descent is a typical algorithm to optimize parameter. We initialize our parameters, to optimize it (so we can minimize our cost function), we subtract the partial derivative of cost function multiplying a learning rate from our parameter. After couple of iterations, our parameter shall converge to an optimal value.
* Notice in each iteration, we usually need to calculate the derivative of whole training set, this is called **batch gradient descent**.
* When we have a very huge data set, traverse the whole set in each iteration would take too much time. Instead, we can split the whole set to many small batches, each iteration only use one batch. This is called **mini-batch gradient descent**.
* An even more extreme case would be using just one sample in each iteration. This is called **stochastic gradient descent**. Notice this will probably never give us a converged result, but we believe it would give us a good approximation to the 'real' optimal value.


## GDA & Naive Bayes
### Discriminative Vs Generative
* Algorithms that try to learn **p(y|x)** directly (such as logistic regression) are called **discriminative** learning algorithms, while algorithms that try to model **p(x|y)** (and p(y)) are called **generative** learning algorithms.

### GDA
* In **Gaussian discriminant analysis (GDA)**, we assume p(x|y) is distributed according to a multivariate normal distribution N(mu, sigma). p(y) follow bernoulli distribution Bernoulli(phi).
* We are able to write the likelihood function using p(x|y) and p(y). To maximize the likelihood function, we take the derivative of it, let it equal to 0, and calculate the values of parameters.
* Suppose we have two output categories 0 and 1, we will end up with two multivariate normal distributions that depict two categories. For any new data point, we just check p(x|y=0) and p(x|y=1) to tell which category it belongs to.

### GDA Vs Logistic regression
* Given our estimated parameter values, we can get the posterior distribution p(y|x). We can prove p(y=1|x) has the same form with **logistic regression**.
* Actually, any GDA-like model with exponential family distribution can be transformed to a same form with logistic regression. However, logistic regression can't be transformed to GDA, since GDA has a **stronger** assumption.
* GDA makes stronger modeling assumptions, and is more data efficient (requires less training data to learn “well”) when the modeling assumptions are correct or approximately correct.
* Logistic regression makes weaker assumptions, and is significantly **more robust** to deviations from modeling assumptions. Specifically, when the data is indeed non-Gaussian, logistic regression will almost always do better than GDA, so in practice logistic regression is used more often than GDA.

### Naive Bayes
*  The assumption of Naive Beyes is that: the different dimensions of X are independent. Use the spam detector as an example, it means the probability of one word exists in email is only related to Y (spam or not spam), not related to other words in this email.
* If a Naive Bayes model saw an element that never showed in training set (e.g. a new word), p(x|y = 1) and p(x| y = 0) will all be 0, which make our posterior a 0/0 situation. To avoid this, we use **Laplace Smoothing**, which adds a constant to denominator of posterior likelihood to avoid 0/0 problem.  

## SVM


## Decision Tree & Ensemble Methods
### Decision Tree
* The loss function we use for decision tree is cross-entropy function L(p) = -sum(p*log(p)). At each node we are just trying to find a split to maximize our reduction on cross-entropy function.
* Regularization techniques in decision tree includes setting minimum leaf size, setting maximum depth or number of nodes, enforcing minimum loss decrease. Another typical way is to train the full tree, then **prune** nodes that minimally decrease misclassification or squared error, as measured on a **validation set**.
* Suppose we have decision tree with depth d, n samples and f features, the train time would be O(nfd). As at each node we need to traverse all features, and for each feature, we need to traverse all samples to find the best split point if it is  a continuous feature.
* Single decision usually has high variance.

### Ensemble Methods
* Combine couple of **independent** weak learners and take the majority vote, we will end up with a much better prediction performance compared to single weak learner.
* **Bagging** use the technique **Bootstrap** to reduce variance. We sample couple of subsamples from whole training set, and train a weak learner on each of them. Finally we aggregate the result from all of them to make our final prediction.
* Bagging + decision tree is called **Random Forest**. Notice we want to make sure our weak learners are as independent as possible, so we sample both training samples and features to be used. Imagine there is very useful feature, we will naturally pick it in each subsample, which brings a high correlation between those weak learners. So we also pick a subset of features every time to reduce variance.
* **Boosting** is a bias-reduction technique. It trained weak learners on weighted samples. **AdaBoost** trains a bunch of weak learners in sequence, at each iteration, it calculates the weight for this learner based on model error, and increases weights for those misclassified points. Finally, combine the prediction results from those weighted weak learners.
* AdaBoost can end up with a non-linear boundary.

## Machine Learning Theory
* One assumption for a machine learning model is that the training set has the same distribution with testing set. So when we saw the model is not performing well, this shall be the first factor to consider.
* Bias and variance are just first and second moments of your parameter. If variance -> 0 when sample size -> infinity, then we call the algorithm is statistically **efficient**; If Bias -> 0 when sample size -> infinity, we call the algorithm is **consistent**.
* How to understand the **bias/variance trade-off**? If we believe there is an optimal parameter existing, then the possible parameters we can get from our algorithm is a set. The bigger the set is, the more likely that optimal parameter would be included in our set, which gives us a smaller bias; while the bigger the set is, the bigger variance we will have. 
