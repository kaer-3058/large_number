#浮点减法
function large_number:round_double/macro4 with storage large_number:math round_double
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math round_double.output set from storage large_number:math temp1
