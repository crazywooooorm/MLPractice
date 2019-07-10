# Tips on Deep Learning

Tips Andrew mentioned in his courses

## Neural Networks and Deep Learning

* Usually, in X matrix each column is one observation, and Y matrix has shape of (1, # observations).

* In logistic regression, typically people prefer log loss function rather than
squared loss function because squared loss function make the optimization
problem become non-convex and have multiple local optima.

* The loss function calculates the loss for one observation, and cost function
is usually the average of the loss of many observations.


## Convolutional Neural Networks
* When there are too many features (e.g. 1000 * 1000 images can have 3 million features), we need some method to convolute the features. In this case, we can multiply the original image feature (n * n) matrix with kernel (or filter, f * f), then we have a convoluted feature matrix with (n-f+1) * (n-f+1).
* In feature matrix, cells in the middle will be convoluted several times, while cells on the sides and corners will only be calculated fewer times, so we can use 'Padding', which means expand our feature matrix with p cells (change from n * n to (n+2p) * (n+2p)) and fill in 0 in those added cells. Then those cells on the sides and corners will be treated just like cells in the middle.
* Another way to better convolute the features is striding, which simply skip s cells in each calculation. We have the convoluted feature matrix as z * z, and z = floor((n+2p-f)/s + 1).
* In a cnn model, if input matrix is ni * ni * ci, then filter matrix can can be nf * nf * cf, ci=cf so that the result of each filter is a two dimensional matrix. The third dimension of output matrix is decided by the number (cn) of filter matrix. Suppose we have padding p and stride s, the output matrix will be [(ni+2p-nf)/s + 1] * [(ni+2p-nf)/s + 1] * cn. For each filter matrix we have a bias. And we activate each element of the output matrix after adding the bias: activate(output_cell + bias).
* In a cnn model, except the convolutional layers above, we also have other type of layers:
  * Pooling layer: Essentially, convolutional layer is just calculating the sum matrix of each area of input matrix. Pooling layer is basically calculating other metrics for each area of input matrix. Max pooling takes the max value of each f * f area and average pooling takes the average value of each f * f area. The parameter we have for pooling matrix is still f (filter) and s (stride). Padding is barely used in pooling layer. Pooling layer doesn't have derivative, so nothing to be learnt, we just fix the parameters as hyperparameters.
  * Fully connected layer: Just like the typical neural network layers, flatten the n * n * c image feature to [n * n * c, 1] matrix. Typically fully connected layer is used at the last a few layers of a cnn model and acts as an output layer.
* In a common cnn model, we usually use a pooling layer after each convolutional layer to shrink our features.
* Why cnn can work with relatively fewer parameters compared to nn?
  * Filter matrix is actually a feature sharing, which is based on the philosophy that a feature detector works on part of the image should also works on other parts.  
  * Sparsity connection between input and output, which means output value actually only depends on a few cells of input image (e.g. only depends on an 3 * 3 area of input image).
* Residual network (ResNet): Take the output of one layer and apply that to another layer which is several layers later. This technique is considered as skipping or jumping over some layers, and in fact wrapping up some layers so that the whole network can be deeper (layers skipped are just like wrapped).
  * Why does ResNet work? Typically the output of layers are non-negative, when adding the residual items it actually make the original layers easier to be activated. For many huge neural networks it can be harder and harder to learn when you add more layers (that is why in many cases even the learning error can be larger when you adding more layers), so as adding non-negative items will at least not make the result worse, it can sometimes improve the performance of the model by adding some extra information.
* 1 * 1 Convolution: Using a 1 * 1 matrix in convolution can change the number ci (third dimension of input matrix), by using different number of filters, without changing the size of other dimensions.
* Inception network is used basically when you can't decide what filter to use (3 * 3 or 5 * 5...), then you can just use all those filters and concatenate them together. To make it possible, padding is needed to adjust the output dimension to be same. In this case the computation can be huge, so we can apply 1 * 1 convolution to shrink the size first. In general, the order is shrink the input matrix with 1 * 1 convolution, then use different filters, finally concatenate them as the output matrix.
* Data Augmentation: When you don't have enough training data, you need some data augmentation techniques to get more data, which includes
  * Mirroring, random cropping, rotation, shearing, local warping
  * Color shifting: adding or minus some values for the original rgb of the images. Especially, PCA color augmentation can do the color shifting on those primary colors that have a higher percentage in your image but keep the rare color stable.  


## Recurrent Neural Networks
* Recurrent Neural Networks is used to deal with sequence data, solve problems like speech recognition or machine translation.
* Basic structure of RNN is a sequence of units, each units consists of the information from previous units and the current input. Each unit has a similar structure (activation function) of normal neural network and each unit can have its output, depends on the problem itself.
* How to define a unit? A unit can be a time point, a word or a character, any sequence can be divided into units.
* RNN might have gradient vanishing or gradient explosion problems when too many layers are included in the model.
  * For gradient explosion, we can always easily notice it by observing huge value of parameters or even NaN (numeric number overflow) or loss becomes extremely unstable from update to update. A good method to solve gradient explosion is to use *gradient clipping*, which means clip the gradients when your gradients exceed some thresholds.
  * For gradient varnishing, we can try GRU (gated recurrent unit) or LSTM (long short-term memory) to grab information from previous layers which are even far away from current layer.
* In GRU (gated recurrent unit), basically for each layer, we treat the output of activation function as a memory cell and it will be grabbed to the next layer. Each layer the memory cell gets updated by the previous memory cell and the output from activation function of the current layer. The weight we give to the old memory cell is decided by the *gated function*, which is another activation function (typically sigmoid). The weight for old memory cell and current layer output sums up to 1. So if output of the current layer is small, we wouldn't update our memory cell, then the useful information from previous layers will keep moving to future layers. GRU helps us to catch the useful information even from really early layers.
* LSTM (long short-term memory) is a general case of GRU, while it doesn't have that 'weight sums up to 1' rule but using separate gated functions for old memory cell and current output.
* Bidirectional RNN: Typically our RNN model is one direction, but some time the important information locates after the current layer. We apply bidirectional RNN to catch useful information form both sides of the sequence and combine the information from two directions to generate output of current layer. The restriction of Bidirectional RNN is we must have the full sequence data, so in a speech recognition case we have to wait people to finish the whole sentence before we can use the RNN model.
* Deep RNNS: stack more layers above the original layer. But we might end up having too many parameters when we use deep RNN.
