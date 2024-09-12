execute store result entity @s Rotation[0] float .001 run scoreboard players get #loops_θ int
data modify storage large_number:math s0 set from entity @s Pos
data modify storage large_number:math s1 set from entity @s Rotation
execute at @s run function large_number:particle/regular_polygon/macro2 with storage large_number:math
execute at @s run tp @s ~ ~ ~ facing .0 .0 .0
execute store result score #temp1 int run data get entity @s Rotation[0] 1000
execute store result entity @s Rotation[0] float .001 run scoreboard players operation #temp1 int -= #temp_add_θ int
scoreboard players set #sstemp4 int 0
data modify storage large_number:math temp1 set value []
function large_number:particle/regular_polygon/loop2
data modify entity @s Pos set from storage large_number:math s0
data modify entity @s Rotation set from storage large_number:math s1
data modify storage large_number:math regular_polygon_Pos append from storage large_number:math temp1
scoreboard players operation #loops_θ int -= #temp_θ int
scoreboard players remove #loops int 1
execute if score #loops int matches 1.. run function large_number:particle/regular_polygon/loop
