##伽玛函数 - Robert H. Windschitl 方法
#输入范围为区间：(-1, 170.6271]

#data modify storage large_number:math gamma_function.input set value 73.2074d

data modify storage large_number:math stemp_gamma_function_inp2 set from storage large_number:math stemp_gamma_function_inp

#1-x
function large_number:elem_complex_function/gamma/macro6 with storage large_number:math stemp_gamma_function_inp
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:elem_complex_function/gamma/as_entity_3
function large_number:elem_complex_function/gamma/macro7 with storage large_number:math stemp_gamma_function_inp

#2π/x
function large_number:elem_complex_function/gamma/2pi_div_x

#sqrt(2π/x)
data modify storage large_number:math double_sqrt.input set from storage large_number:math temp_float_div_comple_out
function large_number:elem_complex_function/gamma/func_sqrt
data modify storage large_number:math temp_sqrt2π/x set from storage large_number:math double_sqrt.output

#1/x
data modify storage large_number:math complex_operation.z1 set from storage large_number:math stemp_gamma_function_inp
function large_number:complex_operation/reciprocal_direct

#sinh(1/x)
data modify storage large_number:math hyperbolic_function.input set from storage large_number:math complex_operation.output
function large_number:elem_complex_function/sinh/start

#x*sinh(1/x)
data modify storage large_number:math complex_operation.z2 set from storage large_number:math hyperbolic_function.output
data modify storage large_number:math complex_operation.z1 set from storage large_number:math stemp_gamma_function_inp
function large_number:complex_operation/multiplication_direct
data modify storage large_number:math temp_x_sinh1/x set from storage large_number:math complex_operation.output

#校正项
#data modify storage large_number:math temp1 set from storage large_number:math temp_x_sinh1/x
#function large_number:elem_complex_function/gamma/correct

#sqrt(x)
data modify storage large_number:math double_sqrt.input set from storage large_number:math temp_x_sinh1/x
function large_number:elem_complex_function/gamma/func_sqrt

#x/e
data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_gamma_function_inp.x
function large_number:elem_complex_function/gamma/os_mul_1_euler_e
data modify storage large_number:math complex_operation.z1.x set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_gamma_function_inp.i
function large_number:elem_complex_function/gamma/os_mul_1_euler_e
data modify storage large_number:math complex_operation.z1.i set from storage large_number:math float_multiply.output

data modify storage large_number:math complex_operation.z2 set from storage large_number:math double_sqrt.output
function large_number:complex_operation/multiplication_direct
#tellraw @a {storage:"large_number:math",nbt:"complex_operation.output"}

#^x
data modify storage large_number:math exp_any.input set value {base:{x:0.0,i:0.0},expon:{x:0.0,i:0.0}}
data modify storage large_number:math exp_any.input.base set from storage large_number:math complex_operation.output
data modify storage large_number:math exp_any.input.expon set from storage large_number:math stemp_gamma_function_inp
scoreboard players set #complex_function_k large_number.int 0
function large_number:elem_complex_function/exp_any/princ_start
data modify storage large_number:math complex_operation.z1 set from storage large_number:math exp_any.output

data modify storage large_number:math complex_operation.z2 set from storage large_number:math temp_sqrt2π/x
function large_number:complex_operation/multiplication_direct
data modify storage large_number:math gamma_function.output set from storage large_number:math complex_operation.output


#使用余元公式计算负数值

#πx
data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_gamma_function_inp2.x
function large_number:elem_complex_function/gamma/os_mul_pi
data modify storage large_number:math sin_cos_high_precision.input set value {x:0.0,i:0.0}
data modify storage large_number:math sin_cos_high_precision.input.x set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_gamma_function_inp2.i
function large_number:elem_complex_function/gamma/os_mul_pi
data modify storage large_number:math sin_cos_high_precision.input.i set from storage large_number:math float_multiply.output

#sin(πx)
#弧度制
function large_number:elem_complex_function/cos_sin/sin

#gamma(1-x)sin(πx)
data modify storage large_number:math complex_operation.z1 set from storage large_number:math gamma_function.output
data modify storage large_number:math complex_operation.z2 set from storage large_number:math sin_cos_high_precision.sin
function large_number:complex_operation/multiplication_direct

#π/(gamma(1-x)sin(πx))
data modify storage large_number:math complex_operation.z1 set from storage large_number:math complex_operation.output
function large_number:complex_operation/reciprocal_direct
data modify storage large_number:math float_multiply.input1 set from storage large_number:math complex_operation.output.x
function large_number:elem_complex_function/gamma/os_mul_pi
data modify storage large_number:math gamma_function.output.x set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input1 set from storage large_number:math complex_operation.output.i
function large_number:elem_complex_function/gamma/os_mul_pi
data modify storage large_number:math gamma_function.output.i set from storage large_number:math float_multiply.output
