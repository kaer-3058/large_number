##浮点数比大小

#data modify storage large_number:math float_comparison_sizes.A set value 6.74503
#data modify storage large_number:math float_comparison_sizes.B set value 6.74502
#A 比较 B，"+"为更大，"-"为更小，"="为相等

#浮点减法

data modify storage large_number:math temp1 set from storage large_number:math float_comparison_sizes.A
data modify storage large_number:math temp2 set from storage large_number:math float_comparison_sizes.B
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute store success score #input+- int if data storage large_number:math {stemp1:"-"}
execute if score #input+- int matches 1 run data modify storage large_number:math temp2 set string storage large_number:math temp2 1 -1

execute if score #input+- int matches 1 run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute if score #input+- int matches 0 run data modify storage large_number:math temp3 set value "-"

function large_number:float_add_subtra/macro2.ope with storage large_number:math
data modify storage large_number:math float_comparison_sizes.output set value ""
execute in minecraft:overworld as @e[type=minecraft:item] if data entity @s Item{id:"minecraft:stone"} if data entity @s Item.tag{large_number_loot_spawn1:1b} run function large_number:float_comparison_sizes/ope_out

execute unless data storage large_number:math float_comparison_sizes{output:"-"} run data modify storage large_number:math float_comparison_sizes.output set value "+"
data modify storage large_number:math temp1 set from storage large_number:math float_comparison_sizes.A
execute store success score #temp int run data modify storage large_number:math temp1 set from storage large_number:math float_comparison_sizes.B
execute if score #temp int matches 0 run data modify storage large_number:math float_comparison_sizes.output set value "="
