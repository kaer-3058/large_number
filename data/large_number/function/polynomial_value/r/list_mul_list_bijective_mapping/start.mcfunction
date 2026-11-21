##列表元素乘常数 - 一一对应的列表乘法

#输入列表1：data modify storage large_number:math list_ope_const_inp set value []
#输入列表2：data modify storage large_number:math list_ope_const_inp_2 set value []
#计算：function large_number:polynomial_value/r/list_mul_list_bijective_mapping/start
#输出：data get storage large_number:math list_ope_const_out

data modify storage large_number:math list_ope_const_out set value []

scoreboard players set #sstemprr1 large_number.int 0
scoreboard players set #sstemprr2 large_number.int 0
execute store result score #sstemprr1 large_number.int run data get storage large_number:math list_ope_const_inp
execute store result score #sstemprr2 large_number.int run data get storage large_number:math list_ope_const_inp_2
scoreboard players operation #sstemprr9 large_number.int = #sstemprr1 large_number.int
scoreboard players operation #sstemprr9 large_number.int -= #sstemprr2 large_number.int
scoreboard players operation #sstemprr1 large_number.int < #sstemprr2 large_number.int

#递归
execute if score #sstemprr1 large_number.int matches 1.. run function large_number:polynomial_value/r/list_mul_list_bijective_mapping/loop1

#剩下的项
execute if score #sstemprr9 large_number.int matches 1.. run data modify storage large_number:math list_ope_const_out append from storage large_number:math list_ope_const_inp[]
execute if score #sstemprr9 large_number.int matches ..-1 run data modify storage large_number:math list_ope_const_out append from storage large_number:math list_ope_const_inp_2[]
