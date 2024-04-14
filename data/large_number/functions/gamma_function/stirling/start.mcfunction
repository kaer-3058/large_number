##伽玛函数 - 斯特林公式近似
#输入范围为区间：[0.5, 170.6271]

#斯特林公式：(sqrt(2πx)·(x/e)^x)·(1+0.0845072303119/x)

#data modify storage math gamma_function.input set value 73.2074d

#2πx
data modify storage math float_multiply.input1 set value 6.283185307179586476d
data modify storage math float_multiply.input2 set from storage math gamma_function.input
function large_number:float_mul.high_precision/start

#sqrt(2πx)
data modify storage math double_sqrt.input set from storage math float_multiply.output
scoreboard players set #double_sqrt.integrate_sci_math int 1
function large_number:double_sqrt_sci

#x/e
data modify storage math temp_sqrt_2pix set from storage math double_sqrt.output.double_sci
data modify storage math float_division.input1 set from storage math gamma_function.input
data modify storage math float_division.input2 set value 2.71828182845904523536028747135266249775724709369995d
function large_number:division/float_12dicimal/start

#(x/e)^x
data modify storage math exp_any.input.base set from storage math float_division.output
data modify storage math exp_any.input.expon set from storage math gamma_function.input
function large_number:exp_any/start
data modify storage math temp_(x/e)^x set from storage math exp_any.output

#0.0845072303119/x
data modify storage math float_division.input1 set value 0.0845072303119
data modify storage math float_division.input2 set from storage math gamma_function.input
function large_number:division/float_12dicimal/start

#1+0.0845072303119/x
data modify storage math temp1 set from storage math float_division.output
execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/stirling/macro4 with storage math

#三个部分相乘
data modify storage math float_multiply.input1 set from storage math temp_sqrt_2pix
data modify storage math float_multiply.input2 set from storage math temp_(x/e)^x
function large_number:float_mul.high_precision/start
data modify storage math float_multiply.input1 set from storage math float_multiply.output
data modify storage math float_multiply.input2 set from storage math temp_1+m/x
function large_number:float_mul.high_precision/start
data modify storage math gamma_function.output set from storage math float_multiply.output


execute if data storage math gamma_function{input:1.0d} run data modify storage math gamma_function.output set value 1.0d
execute if data storage math gamma_function{input:0.0d} run data modify storage math gamma_function.output set value 1.0d
