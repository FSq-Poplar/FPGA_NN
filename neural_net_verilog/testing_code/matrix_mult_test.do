vlib work
vlog -timescale 1ns/1ns matrix_mult_test.v
vsim -L altera_mf_ver matrix_mult_test
log {/*}
add wave {/*}

force {A[23:0]} 24'b000100100011010001010110
force {x[7:0]} 8'b00110110 
run 20ns