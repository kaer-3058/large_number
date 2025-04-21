##一元三次方程计算器

#原理：盛金公式
#见：https://baike.baidu.com/item/%E7%9B%9B%E9%87%91%E5%85%AC%E5%BC%8F
#只给出实数解

#data modify storage large_number:math cubic_equation.input set value [0.0,0.0,0.0,0.0]
#data modify storage large_number:math cubic_equation.input set value [1.728,-14.688,41.616,-39.304]
#data modify storage large_number:math cubic_equation.input set value [1.728,14.688,24.6,-39.304]
#data modify storage large_number:math cubic_equation.input set value [2.0,11.0,10.54,-13.454]
#data modify storage large_number:math cubic_equation.input set value [0.078,-5.3,-36.26,888.0]

#function large_number:cubic_equation/start

data modify storage large_number:math temp_a set from storage large_number:math cubic_equation.input[0]
data modify storage large_number:math temp_b set from storage large_number:math cubic_equation.input[1]
data modify storage large_number:math temp_c set from storage large_number:math cubic_equation.input[2]
data modify storage large_number:math temp_d set from storage large_number:math cubic_equation.input[3]

#盛金判别式

#A
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_b
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math temp_b2 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_a
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_c
function large_number:float_mul.high_precision/start
function large_number:cubic_equation/macro1 with storage large_number:math float_multiply

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_b2
data modify storage large_number:math temp2 set from storage large_number:math q0
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
execute store result score #temp_test.float_add_sub_a2 int store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1
execute store result score #temp_test.float_add_sub_b2 int store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2
execute if score #temp_test.float_add_sub_a int matches ..-1 store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1 -1
execute if score #temp_test.float_add_sub_b int matches ..-1 store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2 -1
scoreboard players set #temp_test.float_add_sub.number_is_large int 0
execute if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub_b int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
scoreboard players operation #temp_test.float_add_sub_a2 int -= #temp_test.float_add_sub_b2 int
execute if score #temp_test.float_add_sub.number_is_large int matches 0 if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub.number_is_large int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:fourier_series_numerical/ope/macro3.6 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 run function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math cubic_equation.A set from storage large_number:math temp1

#B
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_b
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_c
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_bc set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_a
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_d
function large_number:float_mul.high_precision/start
function large_number:cubic_equation/macro2 with storage large_number:math float_multiply

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_bc
data modify storage large_number:math temp2 set from storage large_number:math q0
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
execute store result score #temp_test.float_add_sub_a2 int store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1
execute store result score #temp_test.float_add_sub_b2 int store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2
execute if score #temp_test.float_add_sub_a int matches ..-1 store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1 -1
execute if score #temp_test.float_add_sub_b int matches ..-1 store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2 -1
scoreboard players set #temp_test.float_add_sub.number_is_large int 0
execute if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub_b int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
scoreboard players operation #temp_test.float_add_sub_a2 int -= #temp_test.float_add_sub_b2 int
execute if score #temp_test.float_add_sub.number_is_large int matches 0 if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub.number_is_large int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:fourier_series_numerical/ope/macro3.6 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 run function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math cubic_equation.B set from storage large_number:math temp1

#C
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_c
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math temp_c2 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_b
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_d
function large_number:float_mul.high_precision/start
function large_number:cubic_equation/macro1 with storage large_number:math float_multiply

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_c2
data modify storage large_number:math temp2 set from storage large_number:math q0
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
execute store result score #temp_test.float_add_sub_a2 int store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1
execute store result score #temp_test.float_add_sub_b2 int store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2
execute if score #temp_test.float_add_sub_a int matches ..-1 store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1 -1
execute if score #temp_test.float_add_sub_b int matches ..-1 store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2 -1
scoreboard players set #temp_test.float_add_sub.number_is_large int 0
execute if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub_b int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
scoreboard players operation #temp_test.float_add_sub_a2 int -= #temp_test.float_add_sub_b2 int
execute if score #temp_test.float_add_sub.number_is_large int matches 0 if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub.number_is_large int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:fourier_series_numerical/ope/macro3.6 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 run function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math cubic_equation.C set from storage large_number:math temp1

#delta
data modify storage large_number:math float_multiply.input1 set from storage large_number:math cubic_equation.B
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math temp_b2 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input1 set from storage large_number:math cubic_equation.A
data modify storage large_number:math float_multiply.input2 set from storage large_number:math cubic_equation.C
function large_number:float_mul.high_precision/start
function large_number:quadratic_equation_double/macro1 with storage large_number:math float_multiply

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_b2
data modify storage large_number:math temp2 set from storage large_number:math q0
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
execute store result score #temp_test.float_add_sub_a2 int store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1
execute store result score #temp_test.float_add_sub_b2 int store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2
execute if score #temp_test.float_add_sub_a int matches ..-1 store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1 -1
execute if score #temp_test.float_add_sub_b int matches ..-1 store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2 -1
scoreboard players set #temp_test.float_add_sub.number_is_large int 0
execute if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub_b int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
scoreboard players operation #temp_test.float_add_sub_a2 int -= #temp_test.float_add_sub_b2 int
execute if score #temp_test.float_add_sub.number_is_large int matches 0 if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub.number_is_large int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:fourier_series_numerical/ope/macro3.6 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 run function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math cubic_equation.delta set from storage large_number:math temp1


#浮点数近似判断  1E-6精度近似为0
execute store result score #sstempu int run data get storage large_number:math cubic_equation.A 1000000
execute if score #sstempu int matches -5..4 run data modify storage large_number:math cubic_equation.A set value 0.0

execute store result score #sstempu int run data get storage large_number:math cubic_equation.B 1000000
execute if score #sstempu int matches -5..4 run data modify storage large_number:math cubic_equation.B set value 0.0

execute store result score #sstempu int run data get storage large_number:math cubic_equation.delta 1000000
execute if score #sstempu int matches -5..4 run data modify storage large_number:math cubic_equation.delta set value 0.0


#重根判断
scoreboard players set #cubic_equation.shengjin_mode int 0

data modify storage large_number:math temp1 set from storage large_number:math cubic_equation.A
execute store success score #temp1 int run data modify storage large_number:math temp1 set from storage large_number:math cubic_equation.B
execute if score #temp1 int matches 0 if data storage large_number:math cubic_equation{A:0.0} run scoreboard players set #cubic_equation.shengjin_mode int 1

data modify storage large_number:math temp2 set string storage large_number:math cubic_equation.delta 0 1
execute unless data storage large_number:math {temp2:"-"} unless data storage large_number:math cubic_equation{delta:0.0} run scoreboard players set #cubic_equation.shengjin_mode int 2

execute unless score #cubic_equation.shengjin_mode int matches 1 if data storage large_number:math cubic_equation{delta:0.0} run scoreboard players set #cubic_equation.shengjin_mode int 3

execute if data storage large_number:math {temp2:"-"} run scoreboard players set #cubic_equation.shengjin_mode int 4


#根据模式启用不同的公式
execute if score #cubic_equation.shengjin_mode int matches 1 run function large_number:cubic_equation/formula1
execute if score #cubic_equation.shengjin_mode int matches 2 run function large_number:cubic_equation/formula2
execute if score #cubic_equation.shengjin_mode int matches 3 run function large_number:cubic_equation/formula3
execute if score #cubic_equation.shengjin_mode int matches 4 run function large_number:cubic_equation/formula4

function large_number:cubic_equation/tell
