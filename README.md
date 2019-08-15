# FGPA_NN

A neural network built in Verilog for the DE1-SoC FPGA board for handwritten digit recognition.

The neural network contains 4 layers of sizes 32, 32, 32, and 10.

It is designed with the MNIST database in mind; hence, images should be 28x28.

Note that the input is a 14x14 grid - this is a quick adjustment in IO, however.

## Authors
Wentao Cui @WentaoCui8

Poplar Wang @FSq-Poplar

## Folders
io_verilog: allows users to "draw" a letter, which is passed to the network
- mouse_control: implements mouse support for the DE1-SoC
- vga_adapter: implements VGA support for the DE1-SoC

neural_net_verilog: code for the neural network itself
- testing_code: files used to test the individual modules
- filter: an alternative method of determining numbers for smaller FPGAs

python_simulation: python code used to test different setups of the network

## Notes
mouse_control and vga_adapter modules provided by the University of Toronto

network.py and mnist_loader.py are modified versions of a network released by Michael Nielson (@mnielsen)

image_to_mif.py is a modified version of Thomas Dendale's code (@Nananas)