#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math sstempa0[0]
data modify storage large_number:math temp2 set from storage large_number:math temp_1c1x5s5_x
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math sstempa append from storage large_number:math temp1

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math sstempb0[0]
data modify storage large_number:math temp2 set from storage large_number:math temp_1c1x5s5_y
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math sstempb append from storage large_number:math temp1

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math sstempc0[0]
data modify storage large_number:math temp2 set from storage large_number:math temp_1c1x5s5_z
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math sstempc append from storage large_number:math temp1

data remove storage large_number:math sstempa0[0]
data remove storage large_number:math sstempb0[0]
data remove storage large_number:math sstempc0[0]
execute if data storage large_number:math sstempa0[0] run function large_number:particle/bezier_curve_n/loop0
