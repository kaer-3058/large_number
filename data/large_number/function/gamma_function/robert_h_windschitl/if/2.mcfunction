##伽玛函数 - Robert H. Windschitl 方法
#输入范围为区间：(-1, 170.6271]

#data modify storage large_number:math gamma_function.input set value 73.2074d

#x+1
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/robert_h_windschitl/as_entity_1

#2π/x
function large_number:gamma_function/robert_h_windschitl/float_reciprocal

#sqrt(2π/x)
data remove storage large_number:math double_sqrt
data modify storage large_number:math double_sqrt.input set from storage large_number:math float_reciprocal.output
function large_number:double_sqrt
data modify storage large_number:math temp_sqrt2π/x set from storage large_number:math double_sqrt.output

#1/x
data modify storage large_number:math float_reciprocal.input set from storage large_number:math stemp_gamma_function_inp
function large_number:division/float_reciprocal/start

#sinh(1/x)
data modify storage large_number:math hyperbolic_function.input set from storage large_number:math float_reciprocal.output
function large_number:hyperbolic_function/sinh

#x*sinh(1/x)
data modify storage large_number:math float_multiply.input2 set from storage large_number:math hyperbolic_function.output
data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_gamma_function_inp
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_x_sinh1/x set from storage large_number:math float_multiply.output

#x^6
function large_number:float_mul.high_precision/cube/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
function large_number:float_mul.high_precision/squ/start

#x^-6
data modify storage large_number:math float_reciprocal.input set from storage large_number:math float_multiply.output
function large_number:division/float_reciprocal/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_reciprocal.output

#1/(810x^6)
function large_number:gamma_function/robert_h_windschitl/mul_with_const_1

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math float_multiply.output
data modify storage large_number:math temp2 set from storage large_number:math temp_x_sinh1/x
function large_number:fourier_series_numerical/ope/macro3 with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

#sqrt(x)
data modify storage large_number:math double_sqrt.input set from storage large_number:math temp1
function large_number:double_sqrt

#x/e
data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_gamma_function_inp
function large_number:gamma_function/robert_h_windschitl/mul_with_const_2

data modify storage large_number:math float_multiply.input1 set from storage large_number:math double_sqrt.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_multiply.output
function large_number:float_mul.high_precision/start

#^x
data modify storage large_number:math exp_any.input.base set from storage large_number:math float_multiply.output
data modify storage large_number:math exp_any.input.expon set from storage large_number:math stemp_gamma_function_inp
function large_number:exp_any/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math exp_any.output

data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_sqrt2π/x
function large_number:float_mul.high_precision/start
data modify storage large_number:math gamma_function.output set from storage large_number:math float_multiply.output
