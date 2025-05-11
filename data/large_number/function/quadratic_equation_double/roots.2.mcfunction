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
execute store result score #temp_test.float_add_sub_a2 int run data get storage large_number:math temp1
execute store result score #temp_test.float_add_sub_b2 int run data get storage large_number:math temp2
scoreboard players operation #temp_test.float_add_sub_a int = #temp_test.float_add_sub_a2 int
scoreboard players operation #temp_test.float_add_sub_b int = #temp_test.float_add_sub_b2 int
execute if score #temp_test.float_add_sub_a int matches ..-1 store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1 -1
execute if score #temp_test.float_add_sub_b int matches ..-1 store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2 -1
scoreboard players set #temp_test.float_add_sub.number_is_large int 0
execute if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub_b int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
scoreboard players operation #temp_test.float_add_sub_a2 int += #temp_test.float_add_sub_b2 int
execute if score #temp_test.float_add_sub.number_is_large int matches 0 if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub.number_is_large int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:fourier_series_numerical/ope/macro3.5 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 run function large_number:fourier_series_numerical/ope/macro3 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math float_division.input1 set from storage large_number:math temp1
function large_number:division/float/start
data modify storage large_number:math quadratic_equation_double.output[0] set from storage large_number:math float_division.output

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_-b
data modify storage large_number:math temp2 set from storage large_number:math double_sqrt.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math float_division.input1 set from storage large_number:math temp1
function large_number:division/float/start
data modify storage large_number:math quadratic_equation_double.output[1] set from storage large_number:math float_division.output


data modify storage large_number:math temp1 set string storage large_number:math temp_-b 0 -1
data modify storage large_number:math temp2 set string storage large_number:math temp_delta 0 -1
data modify storage large_number:math temp3 set string storage large_number:math float_division.input2 0 -1
function large_number:quadratic_equation_double/roots.2.expression with storage large_number:math
data modify storage large_number:math quadratic_equation_double.expression set from storage large_number:math q0
