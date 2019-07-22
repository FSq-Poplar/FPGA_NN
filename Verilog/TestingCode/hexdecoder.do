vlib work
vlog -timescale 1ns/1ns hexdecoder.v
vsim hexdecoder
log {/*}
add wave {/*}

force {S} 4'b0000
run 10ns

force {S} 4'b0001
run 10ns

force {S} 4'b0010
run 10ns

force {S} 4'b0011
run 10ns

force {S} 4'b0100
run 10ns

force {S} 4'b0101
run 10ns

force {S} 4'b0111
run 10ns

force {S} 4'b1000
run 10ns

force {S} 4'b1001
run 10ns

force {S} 4'b1010
run 10ns

force {S} 4'b1011
run 10ns

force {S} 4'b1100
run 10ns

force {S} 4'b1101
run 10ns

force {S} 4'b1111
run 10ns