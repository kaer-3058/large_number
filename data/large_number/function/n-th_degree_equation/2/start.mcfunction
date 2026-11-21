#二次方程

data modify storage large_number:math temp_a set from storage large_number:math n-th_degree_equation.input[0]
data modify storage large_number:math temp_b set from storage large_number:math n-th_degree_equation.input[1]
data modify storage large_number:math temp_c set from storage large_number:math n-th_degree_equation.input[2]

#直接应用求根公式

#delta
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_a
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_c
function large_number:float_mul.high_precision/start
function large_number:n-th_degree_equation/2/macro6 with storage large_number:math float_multiply
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_b
function large_number:float_mul.high_precision/squ/start

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math float_multiply.output
data modify storage large_number:math temp2 set from storage large_number:math temp_in1
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

data modify storage large_number:math temp_delta set from storage large_number:math temp1

#符号判断
data modify storage large_number:math temp1 set string storage large_number:math temp_delta 0 1
execute store success score #n-th_degree_equ.2-th.del_sgn large_number.int if data storage large_number:math {temp1:"-"}

execute if score #n-th_degree_equ.2-th.del_sgn large_number.int matches 0 run function large_number:n-th_degree_equation/2/0
execute if score #n-th_degree_equ.2-th.del_sgn large_number.int matches 1 run function large_number:n-th_degree_equation/2/1
