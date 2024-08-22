#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math sstempr[1][0]
data modify storage large_number:math temp2 set from storage large_number:math sstempr[0][0]
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute store success score #input+- int if data storage large_number:math {stemp1:"-"}
execute if score #input+- int matches 1 run data modify storage large_number:math temp2 set string storage large_number:math temp2 1 -1
execute if score #input+- int matches 1 run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute if score #input+- int matches 0 run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute as @e[type=minecraft:item] if data entity @s Item{id:"minecraft:stone"} if data entity @s Item.tag{large_number_loot_spawn1:1b} run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math sstemp030 set string storage large_number:math temp1 0 -1

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math sstempr[1][1]
data modify storage large_number:math temp2 set from storage large_number:math sstempr[0][1]
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute store success score #input+- int if data storage large_number:math {stemp1:"-"}
execute if score #input+- int matches 1 run data modify storage large_number:math temp2 set string storage large_number:math temp2 1 -1
execute if score #input+- int matches 1 run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute if score #input+- int matches 0 run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute as @e[type=minecraft:item] if data entity @s Item{id:"minecraft:stone"} if data entity @s Item.tag{large_number_loot_spawn1:1b} run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math sstemp031 set string storage large_number:math temp1 0 -1

data modify storage large_number:math sstemp038 set string storage large_number:math sstemp030 0 1
data modify storage large_number:math sstemp039 set string storage large_number:math sstemp031 0 1
execute if data storage large_number:math {sstemp038:"-"} run data modify storage large_number:math sstemp030 set string storage large_number:math sstemp030 1
execute if data storage large_number:math {sstemp039:"-"} run data modify storage large_number:math sstemp031 set string storage large_number:math sstemp031 1
function large_number:curve_length/univariate_function/macro6 with storage large_number:math


##二维范数 - 三角函数法
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:double_norm/trif_2d
data modify storage large_number:math sstemps append from storage large_number:math double_norm_2d.output

data remove storage large_number:math sstempr[0]
execute if data storage large_number:math sstempr[1] run function large_number:curve_length/univariate_function/loop2
