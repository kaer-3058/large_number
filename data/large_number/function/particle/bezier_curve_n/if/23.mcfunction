#3
execute store result storage large_number:math float_multiply.input1 double .0001 run scoreboard players get #bezier_curve_N.t int
function large_number:float_mul.high_precision/cube/start
data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_multiply.output
