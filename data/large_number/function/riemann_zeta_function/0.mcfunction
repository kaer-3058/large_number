#x-1
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:riemann_zeta_function/as_entity_1

#x/(x-1)
data modify storage large_number:math float_division.input1 set from storage large_number:math store_zeta_function_inp
function large_number:division/float/start
data modify storage large_number:math temp_zeta_function_t_01 set from storage large_number:math float_division.output

#第二部分
execute store result score #zeta_function_input_inte_test2 large_number.int run data get storage large_number:math store_zeta_function_inp
execute unless score #zeta_function_input_inte_test2 large_number.int matches 4.. run function large_number:riemann_zeta_function/0.0
execute if score #zeta_function_input_inte_test2 large_number.int matches 4.. run function large_number:riemann_zeta_function/0.1

#第三部分
execute store result score #zeta_function_input_inte_test2 large_number.int run data get storage large_number:math store_zeta_function_inp 100
execute if score #zeta_function_input_inte_test2 large_number.int matches ..379 run function large_number:riemann_zeta_function/0.2
execute if score #zeta_function_input_inte_test2 large_number.int matches 380..1199 run function large_number:riemann_zeta_function/0.3
execute if score #zeta_function_input_inte_test2 large_number.int matches 1200.. run function large_number:riemann_zeta_function/0.4

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_zeta_function_t_01
data modify storage large_number:math temp2 set from storage large_number:math temp_zeta_function_t_02
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

#浮点加法
data modify storage large_number:math temp2 set from storage large_number:math temp_zeta_function_t_03
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

data modify storage large_number:math zeta_function.output set from storage large_number:math temp1
