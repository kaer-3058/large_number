#循环

#f(x0)  伽玛函数 - 递推公式
data modify storage large_number:math gamma_function.input set from storage large_number:math inverse_gamma_function.output
function large_number:gamma_function/recursion/start

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math gamma_function.output
data modify storage large_number:math temp2 set from storage large_number:math inverse_gamma_function.input
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math temp_fx set from storage large_number:math temp1

#f'(x0) gamma(x+1)*digamma(x+1)
data modify storage large_number:math digamma_function.input set from storage large_number:math inverse_gamma_function.output
function large_number:inverse_gamma_function/digamma/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math gamma_function.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math digamma_function.output
function large_number:float_mul.high_precision/start

#f(x0)/f'(x0)
data modify storage large_number:math float_division.input1 set from storage large_number:math temp_fx
data modify storage large_number:math float_division.input2 set from storage large_number:math float_multiply.output
function large_number:division/float/start

#浮点减法 x-(f(x0)/f'(x0))
data modify storage large_number:math temp1 set from storage large_number:math inverse_gamma_function.output
data modify storage large_number:math temp2 set from storage large_number:math float_division.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math inverse_gamma_function.output set from storage large_number:math temp1

scoreboard players remove #temp_newton.s_method.loops int 1
execute if score #temp_newton.s_method.loops int matches 1.. run function large_number:inverse_gamma_function/loop
