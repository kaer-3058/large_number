##N阶矩阵的吉文斯旋转

#a：data modify storage large_number:math givens.a set value 2.5
#b：data modify storage large_number:math givens.b set value 7.3
#第一行/列：data modify storage large_number:math givens.i set value []
#第二行/列：data modify storage large_number:math givens.j set value []

#输出：
#data get storage large_number:math givens.out_i
#data get storage large_number:math givens.out_j

#function large_number:n-th_degree_equation/givens/start

#r
data modify storage large_number:math float_multiply.input1 set from storage large_number:math givens.a
data modify storage large_number:math float_multiply.input2 set from storage large_number:math givens.a
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_r1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input1 set from storage large_number:math givens.b
data modify storage large_number:math float_multiply.input2 set from storage large_number:math givens.b
function large_number:float_mul.high_precision/start

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math float_multiply.output
data modify storage large_number:math temp2 set from storage large_number:math temp_r1
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

#c
data modify storage large_number:math double_sqrt.input set from storage large_number:math temp1
scoreboard players set #New_double_sqrt.decimal_add large_number.int 1
function large_number:new_double_ope/double_sqrt
data modify storage large_number:math float_division.input2 set from storage large_number:math double_sqrt.output
data modify storage large_number:math float_division.input1 set from storage large_number:math givens.a
function large_number:division/float/start
data modify storage large_number:math temp_xz_c set from storage large_number:math float_division.output

#s
data modify storage large_number:math float_division.input1 set from storage large_number:math givens.b
function large_number:division/float/start
data modify storage large_number:math temp_xz_s set from storage large_number:math float_division.output
function large_number:n-th_degree_equation/givens/macro1 with storage large_number:math

#循环
data modify storage large_number:math temp_i set from storage large_number:math givens.i
data modify storage large_number:math temp_j set from storage large_number:math givens.j
data modify storage large_number:math temp_o_i set value []
data modify storage large_number:math temp_o_j set value []
execute if data storage large_number:math temp_i[0] run function large_number:n-th_degree_equation/givens/loop

#输出
data modify storage large_number:math givens.out_i set from storage large_number:math temp_o_i
data modify storage large_number:math givens.out_j set from storage large_number:math temp_o_j
