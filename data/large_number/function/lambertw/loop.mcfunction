#循环

#x^2
data modify storage large_number:math float_multiply.input1 set from storage large_number:math lambertw.output
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math temp_x_2 set from storage large_number:math float_multiply.output

#-x
function large_number:lambertw/macro5 with storage large_number:math lambertw

#e^-x
function large_number:exp_e.x/start

#a_0*e^-x
data modify storage large_number:math float_multiply.input1 set from storage large_number:math lambertw.input
data modify storage large_number:math float_multiply.input2 set from storage large_number:math exp_e^x.output
function large_number:float_mul.high_precision/start

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math temp_x_2
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
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

#x+1
function large_number:lambertw/macro6 with storage large_number:math lambertw
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math float_division.input2 set from storage large_number:math temp1

#除法
function large_number:division/float/start

data modify storage large_number:math lambertw.output set from storage large_number:math float_division.output

scoreboard players remove #temp_newton.s_method.loops int 1
execute if score #temp_newton.s_method.loops int matches 1.. run function large_number:lambertw/loop
