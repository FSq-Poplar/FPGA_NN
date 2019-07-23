vlib work
vlog -timescale 1ns/1ns sigmoid.v
vsim -L altera_mf_ver sigmoid
log {/*}
add wave {/*}

#-9, -3, 0, 3, 9
force {x} 32'b11110111000000000000000000000000
run 20ns

force {x} 32'b11111101000000000000000000000000
run 20ns

force {x} 32'b00000000000000000000000000000000
run 20ns

force {x} 32'b00000011000000000000000000000000
run 20ns

force {x} 32'b00001001000000000000000000000000
run 20ns
