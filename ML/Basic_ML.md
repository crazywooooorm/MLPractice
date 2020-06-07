# Basic ML
This markdown is a review for basic ML knowledge. The structure follows syllabus of Andrew Ng's CS229 course. Notes of this course can be found at http://cs229.stanford.edu/notes/.


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
