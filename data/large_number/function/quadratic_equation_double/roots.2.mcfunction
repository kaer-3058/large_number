data modify storage large_number:math quadratic_equation_double.roots set value 2
data modify storage large_number:math quadratic_equation_double.output set value [0.0,0.0]

data modify storage large_number:math double_sqrt.input set from storage large_number:math temp_delta
function large_number:double_sqrt
function large_number:quadratic_equation_double/macro2 with storage large_number:math
function large_number:quadratic_equation_double/macro3 with storage large_number:math
data modify storage large_number:math float_division.input2 set from storage large_number:math q0

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math temp_-b
data modify storage large_number:math temp2 set from storage large_number:math double_sqrt.output
function large_number:fourier_series_numerical/ope/macro3 with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math float_division.input1 set from storage large_number:math temp1
function large_number:division/float/start
data modify storage large_number:math quadratic_equation_double.output[0] set from storage large_number:math float_division.output

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_-b
data modify storage large_number:math temp2 set from storage large_number:math double_sqrt.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math float_division.input1 set from storage large_number:math temp1
function large_number:division/float/start
data modify storage large_number:math quadratic_equation_double.output[1] set from storage large_number:math float_division.output


data modify storage large_number:math temp1 set string storage large_number:math temp_-b 0 -1
data modify storage large_number:math temp2 set string storage large_number:math temp_delta 0 -1
data modify storage large_number:math temp3 set string storage large_number:math float_division.input2 0 -1
function large_number:quadratic_equation_double/roots.2.expression with storage large_number:math
data modify storage large_number:math quadratic_equation_double.expression set from storage large_number:math q0
