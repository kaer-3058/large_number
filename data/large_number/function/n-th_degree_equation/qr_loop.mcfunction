##迭代核心，QR分解

#优化加速策略：Wilkinson位移

#取右下角2*2子矩阵的特征值

data modify storage large_number:math temp_a set from storage large_number:math naive_qr_method_input[-2][-2]
data modify storage large_number:math temp_b set from storage large_number:math naive_qr_method_input[-2][-1]
data modify storage large_number:math temp_c set from storage large_number:math naive_qr_method_input[-1][-2]
data modify storage large_number:math temp_d set from storage large_number:math naive_qr_method_input[-1][-1]

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_a
data modify storage large_number:math temp2 set from storage large_number:math temp_d
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp1
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp1
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_k01 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_b
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_c
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math float_multiply.output

function large_number:n-th_degree_equation/test_complex_eigenvalue/macro2 with storage large_number:math

#浮点加法
data modify storage large_number:math temp2 set from storage large_number:math temp_k01
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

data modify storage large_number:math temp_del set from storage large_number:math temp1

#判断是否需要进行搅动
scoreboard players operation #temp1 large_number.int = #n-th_degree_equ.QR_all_loop_times large_number.int
scoreboard players operation #temp1 large_number.int -= #QR.times large_number.int
scoreboard players operation #temp2 large_number.int = #QR.times large_number.int
scoreboard players operation #temp2 large_number.int %= #n-th_degree_equation.stirring_frequency large_number.int
scoreboard players set #n-th_degree_equation.u_strategy_1.force_move_>=1/2 large_number.int 0
execute if score #temp1 large_number.int >= #n-th_degree_equation.stirring_frequency large_number.int if score #temp2 large_number.int matches 0 if score #n-th_degree_equation.stirring_frequency large_number.int matches 3.. run scoreboard players set #n-th_degree_equation.u_strategy_1.force_move_>=1/2 large_number.int 1

execute if score #n-th_degree_equation.u_strategy_1.force_move_>=1/2 large_number.int matches 1 run function large_number:n-th_degree_equation/contingency_strategy_1/start
execute unless score #n-th_degree_equation.u_strategy_1.force_move_>=1/2 large_number.int matches 1 run function large_number:n-th_degree_equation/contingency_strategy_1/fallback_strategy

#已经迭代过一次
scoreboard players add #QR.times large_number.int 1

#决定是否继续递归
scoreboard players remove #Store_n-th_degree_equ.QR_all_loop_times large_number.int 1
execute if score #Store_n-th_degree_equ.QR_all_loop_times large_number.int matches 1.. run function large_number:n-th_degree_equation/qr_loop
