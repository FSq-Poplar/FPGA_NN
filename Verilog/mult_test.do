vlib work
vlog -timescale 1ns/1ns mult_test.v
vsim -L altera_mf_ver mult_test
log {/*}
add wave {/*}

#2.5*4.25
force {x} 000101000
force {y} 001000100
run 20ns

#2.5*-4.25
force {x} 000101000
force {y} 110111100
run 20ns

#-2.5*4.25
force {x} 111011000
force {y} 001000100
run 20ns

#-2.5*-4.25
force {x} 111011000
force {y} 110111100
run 20ns
