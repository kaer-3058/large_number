data modify storage large_number:math cubic_equation.roots set value 1

#Y1

data modify storage large_number:math double_sqrt.input set from storage large_number:math cubic_equation.delta
function large_number:double_sqrt
data modify storage large_number:math temp1 set from storage large_number:math cubic_equation.B
function large_number:cubic_equation/macro4 with storage large_number:math
function large_number:cubic_equation/macro5 with storage large_number:math

data modify storage large_number:math float_multiply.input1 set from storage large_number:math cubic_equation.A
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_b
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_tab set from storage large_number:math float_multiply.output

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math temp_tb2
data modify storage large_number:math temp2 set from storage large_number:math double_sqrt.output
data modify storage large_number:math temp3 set value ""
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math float_division.input1 set from storage large_number:math temp1
function large_number:cubic_equation/float_div_const

data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_division.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_3a
function large_number:float_mul.high_precision/start

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math float_multiply.output
data modify storage large_number:math temp2 set from storage large_number:math temp_tab
data modify storage large_number:math temp3 set value ""
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math cube_root.input set from storage large_number:math temp1
function large_number:cube_root_double/start
data modify storage large_number:math cubic_equation.cr_Y1 set from storage large_number:math cube_root.output


#Y2

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_tb2
data modify storage large_number:math temp2 set from storage large_number:math double_sqrt.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math float_division.input1 set from storage large_number:math temp1
function large_number:cubic_equation/float_div_const

data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_division.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_3a
function large_number:float_mul.high_precision/start

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math float_multiply.output
data modify storage large_number:math temp2 set from storage large_number:math temp_tab
data modify storage large_number:math temp3 set value ""
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math cube_root.input set from storage large_number:math temp1
function large_number:cube_root_double/start
data modify storage large_number:math cubic_equation.cr_Y2 set from storage large_number:math cube_root.output


#X1

function large_number:cubic_equation/macro6 with storage large_number:math

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math cubic_equation.cr_Y1
data modify storage large_number:math temp2 set from storage large_number:math cubic_equation.cr_Y2
data modify storage large_number:math temp3 set value ""
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

#浮点减法
data modify storage large_number:math temp2 set from storage large_number:math temp1
data modify storage large_number:math temp1 set from storage large_number:math temp_b3
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math float_division.input1 set from storage large_number:math temp1
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_3a
function large_number:division/float/start
data modify storage large_number:math cubic_equation.output set from storage large_number:math float_division.output
