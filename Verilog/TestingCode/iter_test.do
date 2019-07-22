vlib work
vlog -timescale 1ns/1ns iter_test.v
vsim -L altera_mf_ver iter_test
log {/*}
add wave {/*}

force {n} 4'b0101
run 20ns