#定义域报错
data modify storage large_number:math stemp1 set string storage large_number:math _expressionss1 0 1
execute store result storage large_number:math temp1 double 1 run data get storage large_number:math _expressionss1
execute store success score #expression_evaluation_test1 large_number.int run data modify storage large_number:math temp1 set from storage large_number:math _expressionss1
execute if data storage large_number:math {stemp1:"-"} if score #expression_evaluation_test1 large_number.int matches 0 run scoreboard players set #temp_expression_evaluation_error large_number.int 1014
execute if data storage large_number:math {_expressionss1:0.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1014

data modify storage large_number:math stemp1 set string storage large_number:math _expressionss2 0 1
execute store result storage large_number:math temp1 double 1 run data get storage large_number:math _expressionss2
execute store success score #expression_evaluation_test1 large_number.int run data modify storage large_number:math temp1 set from storage large_number:math _expressionss2
execute if data storage large_number:math {stemp1:"-"} if score #expression_evaluation_test1 large_number.int matches 0 run scoreboard players set #temp_expression_evaluation_error large_number.int 1014
execute if data storage large_number:math {_expressionss2:0.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1014

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math _expressionss1
data modify storage large_number:math temp2 set from storage large_number:math _expressionss2
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

data modify storage large_number:math sstempy set from storage large_number:math temp1

data modify storage large_number:math stemp1 set string storage large_number:math sstempy 0 1
execute store result storage large_number:math temp1 double 1 run data get storage large_number:math sstempy
execute store success score #expression_evaluation_test1 large_number.int run data modify storage large_number:math temp1 set from storage large_number:math sstempy
execute if data storage large_number:math {stemp1:"-"} if score #expression_evaluation_test1 large_number.int matches 0 run scoreboard players set #temp_expression_evaluation_error large_number.int 1014
execute if data storage large_number:math {sstempy:0.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1014


execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0


#贝塔函数

scoreboard players set #expression_evaluation_test2 large_number.int 2

data modify storage large_number:math beta_function.input set value [0d,0d]
data modify storage large_number:math beta_function.input[0] set from storage large_number:math _expressionss1
data modify storage large_number:math beta_function.input[1] set from storage large_number:math _expressionss2
function large_number:beta_function/start
data modify storage large_number:math _expressionss3 set from storage large_number:math beta_function.output
