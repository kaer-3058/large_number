function large_number:particle/regular_polygon/macro2 with storage large_number:math
execute at @s run rotate @s facing .0 .0 .0
execute store result score #temp1 large_number.int run data get entity @s Rotation[0] 1000
execute store result entity @s Rotation[0] float .001 run scoreboard players operation #temp1 large_number.int -= #temp_add_θ large_number.int
scoreboard players set #sstemp4 large_number.int 0
data modify storage large_number:math temp1 set value []
function large_number:particle/regular_polygon/loop2

tp @s ~ ~ ~ ~ ~
