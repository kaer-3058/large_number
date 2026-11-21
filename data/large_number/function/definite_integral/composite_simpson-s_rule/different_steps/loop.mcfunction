#循环

#第一个求和
execute store result storage large_number:math temp int 1 run scoreboard players get #int.k large_number.int
function large_number:definite_integral/composite_simpson-s_rule/macro5 with storage large_number:math
scoreboard players operation #Divisor_float_int0 large_number.int = #int.n large_number.int
function large_number:definite_integral/composite_simpson-s_rule/float_div_int_2

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math q0
data modify storage large_number:math temp2 set from storage large_number:math temp_int_a
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

#解析逆波兰式 - 实函数
data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math temp1
function large_number:definite_integral/int_expression_ope
data modify storage large_number:math temp1_sum_inp_1 append from storage large_number:math expression_evaluation.output

#第二个求和
scoreboard players operation #temp1 large_number.int = #int.k large_number.int
scoreboard players operation #temp1 large_number.int *= 10 const
execute store result storage large_number:math temp int 1 run scoreboard players add #temp1 large_number.int 5
function large_number:definite_integral/composite_simpson-s_rule/macro5 with storage large_number:math
scoreboard players operation #Divisor_float_int0 large_number.int = #int.n large_number.int
function large_number:definite_integral/composite_simpson-s_rule/float_div_int_2_spe_div

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math q0
data modify storage large_number:math temp2 set from storage large_number:math temp_int_a
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

#解析逆波兰式 - 实函数
data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math temp1
function large_number:definite_integral/int_expression_ope
data modify storage large_number:math temp1_sum_inp_2 append from storage large_number:math expression_evaluation.output


#循环
scoreboard players add #int.k large_number.int 1
scoreboard players remove #loops large_number.int 1
scoreboard players add #temp_int.composite_simpson-s_rule_diff.loop1 large_number.int 1
execute if score #loops large_number.int matches 1.. if score #temp_int.composite_simpson-s_rule_diff.loop1 large_number.int < #definite_integral.loops large_number.int run function large_number:definite_integral/composite_simpson-s_rule/different_steps/loop
