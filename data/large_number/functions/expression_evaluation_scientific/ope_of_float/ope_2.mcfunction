#浮点减法

scoreboard players set #expression_evaluation_test2 int 2

data modify storage large_number:math temp1 set from storage large_number:math _expressionss1
data modify storage large_number:math temp2 set from storage large_number:math _expressionss2
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute store success score #input+- int if data storage large_number:math {stemp1:"-"}
execute if score #input+- int matches 1 run data modify storage large_number:math temp2 set string storage large_number:math temp2 1 -1
execute if score #input+- int matches 1 run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute if score #input+- int matches 0 run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute as @e[type=minecraft:item] if data entity @s Item{id:"minecraft:stone"} if data entity @s Item.tag{large_number_loot_spawn1:1b} run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math _expressionss3 set from storage large_number:math temp1
