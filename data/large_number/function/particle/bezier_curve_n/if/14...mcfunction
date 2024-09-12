#4..
execute store result storage large_number:math float_base_int_power.base double .0001 run scoreboard players get #bezier_curve_N.1-t int
execute store result storage large_number:math float_base_int_power.expon int 1 run scoreboard players get #bezier_curve_N.loops2 int
function large_number:float_base_int_power/fast_power/start
data modify storage large_number:math store_c16sd_float_multiply_input1 set from storage large_number:math float_base_int_power.output