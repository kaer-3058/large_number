##数值导数 - 差商求导法 - 一阶

#data modify storage large_number:math expression_evaluation.differential.input set value 2.3075
#data modify storage large_number:math expression_evaluation.differential.dx set value 0.004
#dx是一个较小的值，范围是[1, 1E-9]，因浮点误差的存在，此值不可太小，一般选0.01~0.001
#所求导的函数直接取"表达式求值 - 科学计算"解析出来的逆波兰式

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math expression_evaluation.differential.input
data modify storage large_number:math temp2 set from storage large_number:math expression_evaluation.differential.dx
data modify storage large_number:math temp3 set value ""
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute as @e[type=minecraft:item] if data entity @s Item{id:"minecraft:stone"} if data entity @s Item.tag{large_number_loot_spawn1:1b} run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math temp1

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:expression_evaluation_scientific/macro4.output with storage large_number:math
data modify storage large_number:math stempu set from storage large_number:math expression_evaluation.output

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math expression_evaluation.differential.input
data modify storage large_number:math temp2 set from storage large_number:math expression_evaluation.differential.dx
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute store success score #input+- int if data storage large_number:math {stemp1:"-"}
execute if score #input+- int matches 1 run data modify storage large_number:math temp2 set string storage large_number:math temp2 1 -1
execute if score #input+- int matches 1 run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute if score #input+- int matches 0 run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute as @e[type=minecraft:item] if data entity @s Item{id:"minecraft:stone"} if data entity @s Item.tag{large_number_loot_spawn1:1b} run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math temp1

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:expression_evaluation_scientific/macro4.output with storage large_number:math
data modify storage large_number:math temp2 set from storage large_number:math expression_evaluation.output

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math stempu
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute store success score #input+- int if data storage large_number:math {stemp1:"-"}
execute if score #input+- int matches 1 run data modify storage large_number:math temp2 set string storage large_number:math temp2 1 -1
execute if score #input+- int matches 1 run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute if score #input+- int matches 0 run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute as @e[type=minecraft:item] if data entity @s Item{id:"minecraft:stone"} if data entity @s Item.tag{large_number_loot_spawn1:1b} run function large_number:curve_length/univariate_function/float_subtra

#结果
execute store result score #temp1 int run data get storage large_number:math expression_evaluation.differential.dx 2000000000
scoreboard players set #temp2 int 1000000000
scoreboard players operation #temp2 int /= #temp1 int
function large_number:differential/difference_quotient_method/1/macro1 with storage large_number:math
