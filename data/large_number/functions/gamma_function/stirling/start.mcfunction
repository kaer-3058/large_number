##伽玛函数 - 斯特林公式
#输入范围为区间：[0.5, 170.6271]

#斯特林公式：Γ(x+1) ~ sqrt(2πx)·(x/e)^x·(1+0.0845072303119/x)

#data modify storage large_number:math gamma_function.input set value 73.2074d

#sqrt(x)
data remove storage large_number:math double_sqrt
data modify storage large_number:math double_sqrt.input set from storage large_number:math gamma_function.input
scoreboard players set #double_sqrt.integrate_sci_math int 1
function large_number:double_sqrt_sci

#sqrt(2πx)
data modify storage large_number:math float_multiply.input1 set value 2.5066282746310005024157652848110452
data modify storage large_number:math float_multiply.input2 set from storage large_number:math double_sqrt.output.double_sci
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_sqrt_2pix set from storage large_number:math float_multiply.output

#x/e
data modify storage large_number:math float_division.input1 set from storage large_number:math gamma_function.input
data modify storage large_number:math float_division.input2 set value 2.71828182845904523536028747135266249775724709369995
function large_number:division/float_12dicimal/start

#(x/e)^x
data modify storage large_number:math exp_any.input.base set from storage large_number:math float_division.output
data modify storage large_number:math exp_any.input.expon set from storage large_number:math gamma_function.input
function large_number:exp_any/start
data modify storage large_number:math temp_(x/e)^x set from storage large_number:math exp_any.output

#0.0845072303119/x
data modify storage large_number:math float_division.input1 set value 0.0845072303119
data modify storage large_number:math float_division.input2 set from storage large_number:math gamma_function.input
function large_number:division/float_12dicimal/start

#1+0.0845072303119/x
data modify storage large_number:math temp1 set from storage large_number:math float_division.output
execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/stirling/macro1 with storage large_number:math

#三个部分相乘
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_sqrt_2pix
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_(x/e)^x
function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_1+m/x
function large_number:float_mul.high_precision/start
data modify storage large_number:math gamma_function.output set from storage large_number:math float_multiply.output


data modify storage large_number:math temp1 set from storage large_number:math gamma_function.input
execute if data storage large_number:math {temp1:0.0} run data modify storage large_number:math gamma_function.output set value 1.0
execute if data storage large_number:math {temp1:1.0} run data modify storage large_number:math gamma_function.output set value 1.0
execute if data storage large_number:math {temp1:2.0} run data modify storage large_number:math gamma_function.output set value 2.0
