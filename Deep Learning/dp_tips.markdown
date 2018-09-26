# Tips on Deep Learning

Tips Andrew mentioned in his courses

## Course 1: Neural Networks and Deep Learning

* Usually, in X matrix each column is one observation, and Y matrix has shape
of (1, # observations). 

* In logistic regression, typically people prefer log loss function rather than
squared loss function because squared loss function make the optimization
problem become non-convex and have multiple local optima.

* The loss function calculates the loss for one observation, and cost function
is usually the average of the loss of many observations.