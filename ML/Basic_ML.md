# Basic ML
This markdown is a review for basic ML knowledge. The structure follows syllabus of Andrew Ng's CS229 course. Notes of this course can be found at http://cs229.stanford.edu/notes/.

## Logistic Regression
* The form of logistic regression (sigmoid) is actually derived from logit function: log(p/(1-p)) = WX, so coefficients of logistic regression can be interpreted as **expected change in log odds for a one-unit increase in the input variable**.
* Each observation can be represented as a joint distribution: P(xi, yi) = P(y=1|x)^(y)*(1-P(y=1|x))^(1-y), when we multiply all these joint distributions, we get the likelihood function.
* Notice the **log likelihood function** is same with the **cross entropy loss function** (in opposite direction).
* Why use cross entropy instead of MSE as loss function in logistic regression? Because when y_hat is close to 0 or 1, the gradient of loss function would become extremely small (notice the shape of sigmoid function, almost flat at two sides). While the gradient of cross entropy is only related to the difference between y and y_hat (https://blog.csdn.net/yinyu19950811/article/details/81321944).
* The likelihood function of Logistic regression doesn't have closed-form solution (as sigmoid function is nonlinear), so we need iterative optimizations (gradient descent, Newton's method...) to approximate to the optimal solution.

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
* SVM (support vector machine) tries to find a hyperplane to classify two class and at the same time maximize the margin between two classes. The vector that defines the hyperplane is called **support vector**.
* The classification problem can be represented by an optimization problem (maximize margin) under a certain constrain (all points need to be separated correctly by the hyperplane). To solve this problem, we transform it into a dual problem by using **Lagrange multipliers**.
* Original SVM can only deal with linear hyperplane situation. For those non-linear classification problems, we can project the original points to high dimensions then classify them with a linear hyperplane.
* When we project points to high dimensional spaces, the projection function can be very complicated, calculating the inner product of two projected functions can be very computationally expensive. To deal with this situation, we can find some **kernel functions** to reduce our work. For example, **RBF kernel** can deal with the situations when we project our points to infinite dimensional spaces.
* Original SVM is not robust as it needs to make sure each point is correctly classified by the hyperplane, which makes it easily to be affected by outliers. We can add a **slack variable** to make it more robust. This SVM is called **soft-margin SVM**.   

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
* What is the sign of high bias? High training error. It's actually an **under-fit** problem.
* What is the sign of high variance? High testing error given low training error. It's actually an **over-fitting** problem.

## Neural Networks
* Activation function is the soul of neural network. If we don't apply activation function in each layer, not matter how deep your network is, the whole model is just a linear regression.
* The potential disadvantage of sigmoid function (and tanh function) as an activation function is: its gradient is close to 0 when the linear part output (z) is very big or very small, which bring the **vanishing gradient problem**. Given this fact, people prefer relu as an activation function.  
* For optimization of neural network, we prefer mini-batch as it has a good balance of speed and robustness. Another way to speed up the optimization is **Momentum**, the idea is: gradient is decreasing at different speed at different dimension, so instead of using pure backpropagation, we also consider the average past gradient of each dimension when optimizing their corresponding parameter, so dimensions with more space to improve will have a bigger gradient, which makes the optimization much faster.

## EM Algorithm
* EM algorithm is widely used in unsupervised learning. **K-means** and **GMM** are just special cases of EM algorithm with specific distribution assumptions.
* **E-step** is the guess of which cluster each sample belongs. **M-step** updates the parameters of our model based on the guesses from E-step.
* In M-step, our goal is to maximize our log likelihood function. Notice that, directly find the parameters to maximize the likelihood function is quite difficult. In this case, we are using the concave property of log function (Jensen's Inequality), instead of maximize the original likelihood function, we try to maximize its lower-bound.
* The maximum likelihood estimations are quite intuitive: the prior of each cluster is the proportion of samples belonging to this cluster; the mean of each cluster is the mean of samples belonging to this cluster.
* The maxima EM finds are local maxima of the log-likelihood, to make sure we achieve the best estimation, we should try different initiative values. The good part is, different estimations are comparable, the estimation with higher likelihood would be better.

## Density-Based Clustering
* Density-based clustering algorithms can be used when assumptions for EM (parametric algorithm) are not met:
  * round or spherical clusters
  * most dense in center of the sphere (gaussian sphere)
  * not contaminated by noise/outliers
* Density-based clustering is a **non-parametric** method, it looks for regions of the data that are **denser** than the surrounding space, rather than looking for clusters with a particular shape,
* Traditional DBSCAN (Density-based spatial clustering of applications with noise) demands both minimum cluster size and distance threshold epsilon as hyperparameter, while HDBSCAN (Hierarchical DBSCAN) is a DBSCAN implemented with varying epsilon values, which only needs minumum cluster size as parameter.
* [HDBSCAN algorithm](https://towardsdatascience.com/understanding-hdbscan-and-density-based-clustering-121dbee1320e):
  * 1. Given minimum cluster size K, set lambda as smallest value of core distance (shortest distance to have K points included)
  * 2. Filter for points meets the lambda distance
  * 3. Connect points within lambda (if points from two clusters are within the lambda distance, then two clusters are connected and merged), this step helps create the clusters
  * 4. Set lambda to next smallest value of core distance and repeat from step 2, until all points become same cluster
  * 5. Finally we got a Hierarchical clustering tree, each lambda value is a level (hierarchical) of the tree


## Factor Analysis
