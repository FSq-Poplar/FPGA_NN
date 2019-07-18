import network
import mnist_loader

DIRECTORY = "C:\\Users\\snowl\\Documents\\CS\\csc258\\" \
            "final_project\\optimization_python"
MAX_MIN = (1, 5, 15, 35, 5)


def build_lists(min_hidden: int, max_hidden: int,
                min_neurons: int, max_neurons: int, neuron_step: int) -> list:
    """Creates a list of network sizes to try based on five inputs"""
    ret = []
    layers = min_hidden
    while layers <= max_hidden:
        neurons = min_neurons
        while neurons <= max_neurons:
            add = [784]
            counter = 0
            while counter < layers:
                add.append(neurons)
                counter += 1
            add.append(10)
            ret.append(add)
            neurons += neuron_step
        layers += 1
    return ret


def find_optimal() -> None:
    """Scans possible_setups.txt and finds the optimal network size"""
    networks = DIRECTORY + "\\possible_setups.txt"
    with open(networks, "r") as possible_setups:
        best_size = 999999
        best_setup = []
        for line in possible_setups:
            sizes = line.split(",")
            neurons = 0
            for size in sizes:
                neurons += size
            if neurons < best_size:
                best_setup = sizes
    with open(networks, "a") as possible_setups:
        possible_setups.write("Best setup: " + str(best_setup))


if __name__ == '__main__':
    test_sizes = build_lists(MAX_MIN[0], MAX_MIN[1],
                             MAX_MIN[2], MAX_MIN[3], MAX_MIN[4])
    training_data, validation_data, test_data = mnist_loader.load_data_wrapper()

    for test_size in test_sizes:
        net = network.Network(test_size)
        net.sg_descent(training_data, 30, 10, 3.0, test_data=test_data)

    find_optimal()
