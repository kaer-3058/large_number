#浮点加法

scoreboard players set #expression_evaluation_test2 int 2

data modify storage large_number:math temp1 set from storage large_number:math _expressionss1
data modify storage large_number:math temp2 set from storage large_number:math _expressionss2
data modify storage large_number:math temp3 set value ""
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math _expressionss3 set from storage large_number:math temp1
