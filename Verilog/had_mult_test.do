vlib work
vlog -timescale 1ns/1ns had_mult_test.v
vsim -L altera_mf_ver had_mult_test
log {/*}
add wave {/*}

force {x} 16'b0101001011001101
force {y} 16'b1110101000011101
run 20ns


#2.5, 1, -2, -1.5
#-1, -3, 0.5, -1.5
#0101 0010 1100 1101
#1110 1010 0001 1101