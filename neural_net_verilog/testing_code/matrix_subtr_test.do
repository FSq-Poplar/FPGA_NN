vlib work
vlog -timescale 1ns/1ns matrix_subtr_test.v
vsim -L altera_mf_ver matrix_subtr_test
log {/*}
add wave {/*}

# 4-0, (-1)-(-2), 3-1, 4-7, (-3)-2, 1-(-1)
force {A} 24'b010011110011010011010001
force {B} 24'b000011100001011100101111
run 20ns