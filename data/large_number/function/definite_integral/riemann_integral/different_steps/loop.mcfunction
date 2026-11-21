#loop
scoreboard players operation #temp large_number.int = #Store_expression_evaluation.definite_integral.loop large_number.int
execute store result storage large_number:math sstempc int 1 run scoreboard players get #temp large_number.int
function large_number:definite_integral/riemann_integral/macro1 with storage large_number:math

#浮点加法
data modify storage large_number:math temp2 set from storage large_number:math q1
data modify storage large_number:math temp1 set from storage large_number:math expression_evaluation.definite_integral.a
execute store result score #temp_test.float_add_sub_a2 large_number.int run data get storage large_number:math temp1
execute store result score #temp_test.float_add_sub_b2 large_number.int run data get storage large_number:math temp2
scoreboard players operation #temp_test.float_add_sub_a large_number.int = #temp_test.float_add_sub_a2 large_number.int
scoreboard players operation #temp_test.float_add_sub_b large_number.int = #temp_test.float_add_sub_b2 large_number.int
execute if score #temp_test.float_add_sub_a large_number.int matches ..-1 store result score #temp_test.float_add_sub_a large_number.int run data get storage large_number:math temp1 -1
execute if score #temp_test.float_add_sub_b large_number.int matches ..-1 store result score #temp_test.float_add_sub_b large_number.int run data get storage large_number:math temp2 -1
scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 0
execute if score #temp_test.float_add_sub_a large_number.int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 1
execute if score #temp_test.float_add_sub_b large_number.int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 1
scoreboard players operation #temp_test.float_add_sub_a2 large_number.int += #temp_test.float_add_sub_b2 large_number.int
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 0 if score #temp_test.float_add_sub_a large_number.int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 1
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:fourier_series_numerical/ope/macro3.5 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 1 run function large_number:fourier_series_numerical/ope/macro3 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 1 as @e[type=minecraft:item,distance=.0..] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math temp1

#解析逆波兰式 - 实函数
function large_number:definite_integral/int_expression_ope
data modify storage large_number:math sstempr set from storage large_number:math expression_evaluation.output

scoreboard players add #temp_definite_integral.loops large_number.int 1
scoreboard players add #Store_expression_evaluation.definite_integral.loop large_number.int 1
execute unless score #Store_expression_evaluation.definite_integral.loop large_number.int > #Store_expression_evaluation.definite_integral.dx_times large_number.int if score #temp_definite_integral.loops large_number.int < #definite_integral.loops large_number.int run function large_number:definite_integral/riemann_integral/different_steps/loop

#execute unless score #Store_expression_evaluation.definite_integral.loop large_number.int matches 169.. run function large_number:definite_integral/riemann_integral/loop
