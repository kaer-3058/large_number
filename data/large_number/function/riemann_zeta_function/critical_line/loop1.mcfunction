#求和项

execute store result storage large_number:math ln_high_precision.input double 1 run scoreboard players get #temp_sum_n large_number.int
function large_number:ln_high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math riemann_zeta_critical_line_inp
data modify storage large_number:math float_multiply.input2 set from storage large_number:math ln_high_precision.output
function large_number:float_mul.high_precision/start

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math phase_function_out
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math sin_cos_high_precision.input set from storage large_number:math temp1
function large_number:math_trifs/sin_cos_high_precision/large_range_start
data modify storage large_number:math float_division.input1 set from storage large_number:math sin_cos_high_precision.cos
execute store result storage large_number:math double_sqrt.input double 1 run scoreboard players get #temp_sum_n large_number.int
function large_number:new_double_ope/double_sqrt
data modify storage large_number:math float_division.input2 set from storage large_number:math double_sqrt.output
function large_number:division/float/start
data modify storage large_number:math list_sum_inp append from storage large_number:math float_division.output

scoreboard players add #temp_sum_n large_number.int 1
scoreboard players remove #temp_zeta_critical_line_m large_number.int 1
execute if score #temp_zeta_critical_line_m large_number.int matches 1.. run function large_number:riemann_zeta_function/critical_line/loop1
