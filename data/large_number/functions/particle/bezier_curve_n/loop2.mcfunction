#每一次递归都是计算贝塞尔曲线单项的值
#Pi·c(n,i)·(1-t)^(n-i)·t^i

execute if score #bezier_curve_N.loops2 int matches 4.. run function large_number:particle/bezier_curve_n/if/14..
execute if score #bezier_curve_N.loops2 int matches 3 run function large_number:particle/bezier_curve_n/if/13
execute if score #bezier_curve_N.loops2 int matches 2 run function large_number:particle/bezier_curve_n/if/12
execute if score #bezier_curve_N.loops2 int matches 1 store result storage large_number:math store_c16sd_float_multiply_input1 double .0001 run scoreboard players get #bezier_curve_N.1-t int
execute if score #bezier_curve_N.loops2 int matches 0 run data modify storage large_number:math store_c16sd_float_multiply_input1 set value 1.0

execute if score #bezier_curve_N.loops int matches 4.. run function large_number:particle/bezier_curve_n/if/24..
execute if score #bezier_curve_N.loops int matches 3 run function large_number:particle/bezier_curve_n/if/23
execute if score #bezier_curve_N.loops int matches 2 run function large_number:particle/bezier_curve_n/if/22
execute if score #bezier_curve_N.loops int matches 1 store result storage large_number:math float_multiply.input2 double .0001 run scoreboard players get #bezier_curve_N.t int
execute if score #bezier_curve_N.loops int matches 0 run data modify storage large_number:math float_multiply.input2 set value 1.0

data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_c16sd_float_multiply_input1

function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math Store_temp_nCr[0]
function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math sstempa_s[0]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_Pi append from storage large_number:math float_multiply.output

scoreboard players add #bezier_curve_N.loops int 1
scoreboard players remove #bezier_curve_N.loops2 int 1
data remove storage large_number:math sstempa_s[0]
data remove storage large_number:math Store_temp_nCr[0]
execute if score #bezier_curve_N.loops int <= #bezier_curve_N.order int run function large_number:particle/bezier_curve_n/loop2
