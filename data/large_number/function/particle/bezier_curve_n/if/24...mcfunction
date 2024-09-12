#4..
execute store result storage large_number:math float_base_int_power.base double .0001 run scoreboard players get #bezier_curve_N.t int
execute store result storage large_number:math float_base_int_power.expon int 1 run scoreboard players get #bezier_curve_N.loops int
function large_number:float_base_int_power/fast_power/start
data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_base_int_power.output
