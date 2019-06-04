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
* In a cnn model, if input matrix is ni*ni*ci, then filter matrix can can be nf*nf*cf, ci=cf so that the result of each filter is a two dimensional matrix. The third dimension of output matrix is decided by the number (cn) of filter matrix. Suppose we have padding p and stride s, the output matrix will be [(ni+2p-nf)/s + 1] * [(ni+2p-nf)/s + 1] * cn. For each filter matrix we have a bias. And we activate each element of the output matrix after adding the bias: activate(output_cell + bias).
* In a cnn model, except the convolutional layers above, we also have other type of layers:
  * Pooling layer: Essentially, convolutional layer is just calculating the sum matrix of each area of input matrix. Pooling layer is basically calculating other metrics for each area of input matrix. Max pooling takes the max value of each f*f area and average pooling takes the average value of each f*f area. The parameter we have for pooling matrix is still f (filter) and s (stride). Padding is barely used in pooling layer. Pooling layer doesn't have derivative, so nothing to be learnt, we just fix the parameters as hyperparameters.
  * Fully connected layer: Just like the typical neural network layers, flatten the n*n*c image feature to [n*n*c, 1] matrix. Typically fully connected layer is used at the last a few layers of a cnn model and acts as an output layer.
* In a common cnn model, we usually use a pooling layer after each convolutional layer to shrink our features.
* Why cnn can work with relatively fewer parameters compared to nn?
  * Filter matrix is actually a feature sharing, which is based on the philosophy that a feature detector works on part of the image should also works on other parts.  
  * Sparsity connection between input and output, which means output value actually only depends on a few cells of input image (e.g. only depends on an 3*3 area of input image).
* Residual network (ResNet): Take the output of one layer and apply that to another layer which is several layers later. This technique is considered as skipping or jumping over some layers, and in fact wrapping up some layers so that the whole network can be deeper (layers skipped are just like wrapped).
  * Why does ResNet work? Typically the output of layers are non-negative, when adding the residual items it actually make the original layers easier to be activated. For many huge neural networks it can be harder and harder to learn when you add more layers (that is why in many cases even the learning error can be larger when you adding more layers), so as adding non-negative items will at least not make the result worse, it can sometimes improve the performance of the model by adding some extra information.
* 1*1 Convolution: Using a 1*1 matrix in convolution can change the number ci (third dimension of input matrix), by using different number of filters, without changing the size of other dimensions. 
