import random
import numpy as np


class Network(object):
    """
    Basic neural network created by Michael Nielson
    Updated for Python 3 and clarity

    === Private attributes ===
    num_layers: number of layers, including inputs and outputs
    sizes: list which specifies neurons per layer
    biases: the biases of the neurons (note not present on layer 1)
    weights: the weights of each of the connections
    """
    num_layers: int
    sizes: list
    _biases: list
    _weights: list

    def __init__(self, sizes: list):
        self.num_layers = len(sizes)
        self.sizes = sizes
        self._biases = [np.random.randn(y, 1) for y in sizes[1:]]
        self._weights = [np.random.randn(y, x)
                         for x, y in zip(sizes[:-1], sizes[1:])]

    def feed_forward(self, a) -> float:
        """Return the output of the network if 'a' is input"""
        for b, w in zip(self._biases, self._weights):
            a = sigmoid(np.dot(w, a)+b)
        return a

    def sg_descent(self, training_data: list, epochs: int, mini_batch_size: int
                   , eta: float, test_data=None) -> None:
        """Train the network using mini-batch stochastic gradient descent"""
        if test_data:
            n_test = len(test_data)
        n = len(training_data)

        for j in range(epochs):
            random.shuffle(training_data)
            mini_batches = [
                training_data[k:k+mini_batch_size]
                for k in range(0, n, mini_batch_size)]
            for mini_batch in mini_batches:
                self.update_mini_batch(mini_batch, eta)
            if test_data:
                print("Epoch {0}: {1} / {2}".format(
                    j, self.evaluate(test_data), n_test))
            else:
                print("Epoch {0} complete".format(j))

    def update_mini_batch(self, mini_batch: list, eta: float) -> None:
        """Update the network's weights and biases by applying
        gradient descent using back-propagation to a single mini batch"""
        nabla_b = [np.zeros(b.shape) for b in self._biases]
        nabla_w = [np.zeros(w.shape) for w in self._weights]

        for x, y in mini_batch:
            delta_nabla_b, delta_nabla_w = self.back_propagation(x, y)
            nabla_b = [nb+dnb for nb, dnb in zip(nabla_b, delta_nabla_b)]
            nabla_w = [nw+dnw for nw, dnw in zip(nabla_w, delta_nabla_w)]

        self._weights = [w - (eta / len(mini_batch)) * nw
                         for w, nw in zip(self._weights, nabla_w)]

        self._biases = [b - (eta / len(mini_batch)) * nb
                        for b, nb in zip(self._biases, nabla_b)]

    def back_propagation(self, x: float, y: float) -> tuple:
        """Return a tuple (nabla_b, nabla_w) representing
        the gradient for the cost function C_x"""
        nabla_b = [np.zeros(b.shape) for b in self._biases]
        nabla_w = [np.zeros(w.shape) for w in self._weights]
        activation = x
        activations = [x]
        zs = []

        for b, w in zip(self._biases, self._weights):
            z = np.dot(w, activation)+b
            zs.append(z)
            activation = sigmoid(z)
            activations.append(activation)

        delta = self.cost_derivative(activations[-1], y) * \
            sigmoid_prime(zs[-1])
        nabla_b[-1] = delta
        nabla_w[-1] = np.dot(delta, activations[-2].transpose())

        for l in range(2, self.num_layers):
            z = zs[-l]
            sp = sigmoid_prime(z)
            delta = np.dot(self._weights[-l + 1].transpose(), delta) * sp
            nabla_b[-l] = delta
            nabla_w[-l] = np.dot(delta, activations[-l-1].transpose())

        return nabla_b, nabla_w

    def evaluate(self, test_data: list) -> int:
        """Return the number of test inputs for which the neural
        network outputs the correct result"""
        test_results = [(np.argmax(self.feed_forward(x)), y)
                        for (x, y) in test_data]
        return sum(int(x == y) for (x, y) in test_results)

    @staticmethod
    def cost_derivative(output_activations: float, y: float) -> float:
        """Return the vector of partial derivatives
        partial C_x / partial a
        for the output activations."""
        return output_activations - y


def sigmoid(z):
    """The sigmoid function."""
    return 1.0/(1.0+np.exp(-z))


def sigmoid_prime(z):
    """Derivative of the sigmoid function."""
    return sigmoid(z)*(1-sigmoid(z))
