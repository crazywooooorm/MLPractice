# Tips on Deep Learning

Tips Andrew mentioned in his courses

## Course 1: Neural Networks and Deep Learning

* Usually, in X matrix each column is one observation, and Y matrix has shape of (1, # observations).

* In logistic regression, typically people prefer log loss function rather than
squared loss function because squared loss function make the optimization
problem become non-convex and have multiple local optima.

* The loss function calculates the loss for one observation, and cost function
is usually the average of the loss of many observations.


## Convolutional Neural Networks
* When there are too many features (e.g. 1000*1000 images can have 3 million features), we need some method to convolute the features. In this case, we can multiply the original image feature (n * n) matrix with kernel (or filter, f * f), then we have a convoluted feature matrix with (n-f+1) * (n-f+1).
* In feature matrix, cells in the middle will be convoluted several times, while cells on the sides and corners will only be calculated fewer times, so we can use 'Padding', which means expand our feature matrix with p cells (change from n * n to (n+2p) * (n+2p)) and fill in 0 in those added cells. Then those cells on the sides and corners will be treated just like cells in the middle.
* Another way to better convolute the features is striding, which simply skip s cells in each calculation. We have the convoluted feature matrix as z * z, and z = floor((n+2p-f)/s + 1).
