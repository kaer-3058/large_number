#3
execute store result storage large_number:math float_multiply.input1 double .0001 run scoreboard players get #bezier_curve_N.1-t int
function large_number:float_mul.high_precision/cube/start
data modify storage large_number:math store_c16sd_float_multiply_input1 set from storage large_number:math float_multiply.output
