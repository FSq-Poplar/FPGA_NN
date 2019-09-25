import _pickle as cPickle
import gzip
import numpy as np
import os


def load_data():
    """
    MNIST data loader created by Michael Nielson for his corresponding
    neural network
    Updated for Python 3 and clarity
    """
    f = gzip.open(os.getcwd() + os.sep + "data" + os.sep + "mnist.pkl.gz")
    training_data, validation_data, test_data = \
        cPickle.load(f, encoding='iso-8859-1')
    f.close()
    return training_data, validation_data, test_data


def load_data_wrapper():
    """Return a tuple containing ``(training_data, validation_data,
    test_data)``"""
    tr_d, va_d, te_d = load_data()
    training_inputs = [np.reshape(x, (784, 1)) for x in tr_d[0]]
    training_results = [vectorized_result(y) for y in tr_d[1]]
    training_data = list(zip(training_inputs, training_results))
    validation_inputs = [np.reshape(x, (784, 1)) for x in va_d[0]]
    validation_data = list(zip(validation_inputs, va_d[1]))
    test_inputs = [np.reshape(x, (784, 1)) for x in te_d[0]]
    test_data = list(zip(test_inputs, te_d[1]))
    return training_data, validation_data, test_data


def vectorized_result(j):
    """Return a 10-dimensional unit vector with a 1.0 in the jth
    position and zeroes elsewhere"""
    e = np.zeros((10, 1))
    e[j] = 1.0
    return e
