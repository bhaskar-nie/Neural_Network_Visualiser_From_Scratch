# Neural Network Implementation Details

This document provides a detailed explanation of the neural network implementation used in the Neural Network Visualizer application. The implementation is built from scratch using only NumPy, without relying on any machine learning frameworks.

## Table of Contents
1. [Architecture Overview](#architecture-overview)
2. [Forward Propagation](#forward-propagation)
3. [Backward Propagation](#backward-propagation)
4. [Weight Updates](#weight-updates)
5. [Loss Function](#loss-function)
6. [Initialization](#initialization)
7. [Training Process](#training-process)
8. [Visualization Techniques](#visualization-techniques)

## Architecture Overview

The neural network has a simple architecture designed for binary classification:

- **Input Layer**: 2 neurons (CGPA and IQ)
- **Hidden Layer**: Configurable number of neurons (default: 2)
- **Output Layer**: 1 neuron (Placement prediction)

Each layer is fully connected to the next layer, and we use sigmoid activation functions throughout the network.

## Forward Propagation

The forward propagation process is implemented in the `forward_propagation` method of the `NeuralNetwork` class:

```python
def forward_propagation(self, X):
    cache = {}
    A = X
    L = len(self.parameters) // 2
    
    # Forward propagation through hidden layers
    for l in range(1, L):
        A_prev = A
        cache['A' + str(l-1)] = A_prev
        
        Z = np.dot(self.parameters['W' + str(l)], A_prev) + self.parameters['b' + str(l)]
        A = self.sigmoid(Z)
        cache['Z' + str(l)] = Z
    
    # Output layer
    ZL = np.dot(self.parameters['W' + str(L)], A) + self.parameters['b' + str(L)]
    AL = self.sigmoid(ZL)
    cache['Z' + str(L)] = ZL
    cache['A' + str(L)] = AL
    
    return AL, cache
```

The method takes a batch of input examples X and computes:
1. Linear transformation: Z = W * A_prev + b
2. Activation: A = sigmoid(Z)
3. Stores intermediate values in a cache for use in backpropagation

The sigmoid activation function is defined as:

```python
def sigmoid(self, Z):
    return 1 / (1 + np.exp(-Z))
```

## Backward Propagation

Backpropagation is implemented in the `backward_propagation` method:

```python
def backward_propagation(self, X, Y, cache):
    grads = {}
    m = X.shape[1]
    L = len(self.parameters) // 2
    
    # Initialize gradients
    dAL = - (np.divide(Y, cache['A' + str(L)]) - np.divide(1 - Y, 1 - cache['A' + str(L)]))
    
    # Backpropagation for last layer
    dZL = dAL * cache['A' + str(L)] * (1 - cache['A' + str(L)])
    grads['dW' + str(L)] = 1/m * np.dot(dZL, cache['A' + str(L-1)].T)
    grads['db' + str(L)] = 1/m * np.sum(dZL, axis=1, keepdims=True)
    dA_prev = np.dot(self.parameters['W' + str(L)].T, dZL)
    
    # Backpropagation for remaining layers
    for l in reversed(range(1, L)):
        dZ = dA_prev * cache['A' + str(l)] * (1 - cache['A' + str(l)])
        if l == 1:
            grads['dW' + str(l)] = 1/m * np.dot(dZ, X.T)
        else:
            grads['dW' + str(l)] = 1/m * np.dot(dZ, cache['A' + str(l-1)].T)
        grads['db' + str(l)] = 1/m * np.sum(dZ, axis=1, keepdims=True)
        
        if l > 1:
            dA_prev = np.dot(self.parameters['W' + str(l)].T, dZ)
    
    return grads
```

This method computes the gradients of the cost function with respect to each parameter:
1. Computes gradients of the loss with respect to the output layer
2. Propagates these gradients backward through the network
3. Computes gradients for each weight and bias parameter

## Weight Updates

The parameters are updated using the computed gradients:

```python
def update_parameters(self, grads, learning_rate):
    L = len(self.parameters) // 2
    
    for l in range(1, L + 1):
        self.parameters['W' + str(l)] -= learning_rate * grads['dW' + str(l)]
        self.parameters['b' + str(l)] -= learning_rate * grads['db' + str(l)]
```

This implementation uses standard gradient descent with a fixed learning rate.

## Loss Function

We use binary cross-entropy loss as our cost function:

```python
def compute_cost(self, AL, Y):
    m = Y.shape[0]
    epsilon = 1e-15
    
    # Binary cross-entropy cost
    AL = np.clip(AL, epsilon, 1-epsilon)
    cost = -1/m * np.sum(Y * np.log(AL) + (1 - Y) * np.log(1 - AL))
    
    return cost
```

The small epsilon value prevents taking the logarithm of zero, which would lead to numerical instability.

## Initialization

The network parameters are initialized with small random values to break symmetry:

```python
def initialize_parameters(self, layer_dimensions=None):
    if layer_dimensions:
        self.layer_dimensions = layer_dimensions
        
    np.random.seed(3)
    parameters = {}
    L = len(self.layer_dimensions)
    
    for l in range(1, L):
        parameters['W' + str(l)] = np.random.randn(self.layer_dimensions[l], self.layer_dimensions[l - 1]) * 0.01
        parameters['b' + str(l)] = np.zeros((self.layer_dimensions[l], 1))
    
    self.parameters = parameters
    return parameters
```

We use:
- Small random values (scaled by 0.01) for weights
- Zeros for biases
- A fixed random seed for reproducibility

## Training Process

The training process combines all these components:

```python
def train(self, learning_rate=0.01, epochs=100, batch_size=None, callback=None):
    # Initialize parameters if not already initialized
    if self.parameters is None:
        self.initialize_parameters()
    
    m = self.X_train.shape[0]
    X = self.X_train.T  # Transpose to (n_features, n_samples)
    Y = self.y_train.reshape(1, -1)  # Reshape to (1, n_samples)
    
    # Reset training history
    self.training_history = {
        'loss': [],
        'accuracy': [],
        'weights': [],
        'biases': [],
        'decision_boundaries': []
    }
    
    for epoch in range(epochs):
        # Forward propagation
        AL, cache = self.forward_propagation(X)
        
        # Compute cost
        cost = self.compute_cost(AL, Y)
        
        # Backward propagation
        grads = self.backward_propagation(X, Y, cache)
        
        # Update parameters
        self.update_parameters(grads, learning_rate)
        
        # Calculate accuracy
        predictions = self.predict(X)
        accuracy = self.calculate_accuracy(predictions, Y)
        
        # Save history and call callback
        # ...
        
    return self.training_history
```

## Visualization Techniques

### Neural Network Visualization

We visualize the neural network by:
1. Drawing circles to represent neurons
2. Drawing lines to represent weights
3. Using color to represent weight values (green for positive, red for negative)
4. Using the intensity of the color to represent the magnitude of the weight

### Decision Boundary Visualization

We create a decision boundary visualization by:
1. Creating a mesh grid covering the input space
2. Making predictions for each point in the grid
3. Coloring the regions where the prediction is 0 or 1
4. Overlaying the actual data points

```python
def generate_decision_boundary(self, X, Y):
    # Create a meshgrid
    h = 0.05  # Step size
    x_min, x_max = X[0, :].min() - 1, X[0, :].max() + 1
    y_min, y_max = X[1, :].min() - 1, X[1, :].max() + 1
    xx, yy = np.meshgrid(np.arange(x_min, x_max, h), np.arange(y_min, y_max, h))
    
    # Reshape and make predictions
    Z = np.zeros((yy.shape[0], xx.shape[1]))
    for i in range(yy.shape[0]):
        for j in range(xx.shape[1]):
            Z[i, j] = self.predict(np.array([[xx[i, j]], [yy[i, j]]]))[0, 0]
    
    # Generate plot
    # ...
```

## Conclusion

This implementation demonstrates the core principles of neural networks without relying on high-level frameworks. By building from scratch, we gain a deeper understanding of how neural networks work and are able to visualize each component in detail.

The complete implementation can be found in `backend/app/neural_network.py`. 