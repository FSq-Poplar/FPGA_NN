vlib work
vlog -timescale 1ns/1ns matrix_scalar_mult_test.v
vsim -L altera_mf_ver matrix_scalar_mult_test
log {/*}
add wave {/*}

# A values: -2, -1, 0, 0.5, 1, 2
force {A} 24'b110011100000000100100100
# Multiply by .5
force {a} 4'b0001
run 20ns

# Multiply by -1
force {a} 4'b1110
run 20ns