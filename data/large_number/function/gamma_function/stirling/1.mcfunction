##伽玛函数 - 斯特林公式
#输入范围为区间：[0.5, 170.6271]

#斯特林公式：Γ(x+1) ~ sqrt(2πx)·(x/e)^x·(1+0.0845072303119/x) x≥0.2216

#data modify storage large_number:math gamma_function.input set value 73.2074d

#sqrt(x)
data remove storage large_number:math double_sqrt
data modify storage large_number:math double_sqrt.input set from storage large_number:math gamma_function.input
function large_number:double_sqrt

#sqrt(2πx)
data modify storage large_number:math float_multiply.input1 set from storage large_number:math double_sqrt.output
function large_number:gamma_function/stirling/mul_with_const_1
data modify storage large_number:math temp_sqrt_2pix set from storage large_number:math float_multiply.output

#x/e
data modify storage large_number:math float_multiply.input1 set from storage large_number:math gamma_function.input
function large_number:gamma_function/stirling/mul_with_const_2

#(x/e)^x
data modify storage large_number:math exp_any.input.base set from storage large_number:math float_multiply.output
data modify storage large_number:math exp_any.input.expon set from storage large_number:math gamma_function.input
scoreboard players set #exp_any.mode int 1
function large_number:exp_any/start
data modify storage large_number:math temp_(x/e)^x set from storage large_number:math exp_any.output

#0.0845072303119/x
function large_number:gamma_function/stirling/float_reciprocal

#1+0.0845072303119/x
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/stirling/as_entity_1

#三个部分相乘
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_sqrt_2pix
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_(x/e)^x
function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_1+m/x
function large_number:float_mul.high_precision/start
data modify storage large_number:math gamma_function.output set from storage large_number:math float_multiply.output
