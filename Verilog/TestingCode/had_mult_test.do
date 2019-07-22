vlib work
vlog -timescale 1ns/1ns had_mult_test.v
vsim -L altera_mf_ver had_mult_test
log {/*}
add wave {/*}

force {x} 16'b0001001001010111
force {y} 16'b0001001101000111
run 20ns