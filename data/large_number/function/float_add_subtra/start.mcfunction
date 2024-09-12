##浮点加减法

#data modify storage large_number:math float_add_subtra.input1 set value 1.0
#data modify storage large_number:math float_add_subtra.input2 set value 3.0
#scoreboard players set #float_add_subtra_ope_mode int 1

data modify storage large_number:math temp1 set from storage large_number:math float_add_subtra.input1
data modify storage large_number:math temp2 set from storage large_number:math float_add_subtra.input2
scoreboard players set #input+- int 0
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run scoreboard players set #input+- int 1
execute if score #float_add_subtra_ope_mode int matches 2 if score #input+- int matches 1 run data modify storage large_number:math temp2 set string storage large_number:math temp2 1 -1

execute if score #float_add_subtra_ope_mode int matches 2 if score #input+- int matches 1 run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute if score #float_add_subtra_ope_mode int matches 2 if score #input+- int matches 0 run data modify storage large_number:math temp3 set value "-"

function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:float_add_subtra/output
