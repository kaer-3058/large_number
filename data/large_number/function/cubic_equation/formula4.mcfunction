data modify storage large_number:math cubic_equation.roots set value 3

data modify storage large_number:math cubic_equation.output set value [0.0,0.0,0.0]

function large_number:cubic_equation/macro6 with storage large_number:math

#√A
data modify storage large_number:math double_sqrt.input set from storage large_number:math cubic_equation.A
function large_number:double_sqrt
data modify storage large_number:math temp_sqa set from storage large_number:math double_sqrt.output

#T
data modify storage large_number:math float_multiply.input1 set from storage large_number:math cubic_equation.A
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_b
function large_number:float_mul.high_precision/start

function large_number:cubic_equation/macro7 with storage large_number:math float_multiply

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_a
data modify storage large_number:math float_multiply.input2 set from storage large_number:math cubic_equation.B
function large_number:float_mul.high_precision/start

function large_number:cubic_equation/macro8 with storage large_number:math float_multiply

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math q0
data modify storage large_number:math temp2 set from storage large_number:math q1
data modify storage large_number:math temp3 set value ""
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math float_division.input1 set from storage large_number:math temp1

data modify storage large_number:math float_multiply.input1 set from storage large_number:math cubic_equation.A
function large_number:float_mul.high_precision/cube/start
data modify storage large_number:math double_sqrt.input set from storage large_number:math float_multiply.output
function large_number:double_sqrt
function large_number:cubic_equation/macro7 with storage large_number:math double_sqrt
data modify storage large_number:math float_division.input2 set from storage large_number:math q0

function large_number:division/float/start

#arccosT
execute store result score #arcsin_cos.input int run data get storage large_number:math float_division.output 10000
function large_number:math_trifs/arccos

#三角函数
execute store result storage large_number:math sin_cos_high_precision.input float .0000003333333333333333333333333 run data get entity b09e-44-fded-6-efa5ffffef64 Rotation[0] 1000000
function large_number:math_trifs/sin_cos_high_precision/start
execute store result storage large_number:math temp_sin double .0000000017320508075688772935274463 run data get storage large_number:math sin_cos_high_precision.sin 1000000000
data modify storage large_number:math temp_cos set from storage large_number:math sin_cos_high_precision.cos


#X1

function large_number:cubic_equation/macro9 with storage large_number:math

data modify storage large_number:math float_multiply.input1 set from storage large_number:math q0
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_cos
function large_number:float_mul.high_precision/start

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math float_multiply.output
data modify storage large_number:math temp2 set from storage large_number:math temp_b3
data modify storage large_number:math temp3 set value ""
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

function large_number:cubic_equation/macro5 with storage large_number:math
data modify storage large_number:math float_division.input1 set from storage large_number:math temp1
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_3a
function large_number:division/float/start
data modify storage large_number:math cubic_equation.output[0] set from storage large_number:math float_division.output


#X2

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math temp_cos
data modify storage large_number:math temp2 set from storage large_number:math temp_sin
data modify storage large_number:math temp3 set value ""
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp1
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_sqa
function large_number:float_mul.high_precision/start

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math float_multiply.output
data modify storage large_number:math temp2 set from storage large_number:math temp_b3
data modify storage large_number:math temp3 set value ""
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math float_division.input1 set from storage large_number:math temp1
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_3a
function large_number:division/float/start
data modify storage large_number:math cubic_equation.output[1] set from storage large_number:math float_division.output


#X3

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_cos
data modify storage large_number:math temp2 set from storage large_number:math temp_sin
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra


data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp1
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_sqa
function large_number:float_mul.high_precision/start

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math float_multiply.output
data modify storage large_number:math temp2 set from storage large_number:math temp_b3
data modify storage large_number:math temp3 set value ""
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math float_division.input1 set from storage large_number:math temp1
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_3a
function large_number:division/float/start
data modify storage large_number:math cubic_equation.output[2] set from storage large_number:math float_division.output

