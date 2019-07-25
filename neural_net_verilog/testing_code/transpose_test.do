vlib work
vlog -timescale 1ns/1ns transpose_test.v
vsim -L altera_mf_ver transpose_test
log {/*}
add wave {/*}

force {A} 24'b000000010010001101000101
run 20ns
