execute store result entity @s Rotation[0] float .001 run scoreboard players get #loops_θ large_number.int
execute at @s run function large_number:particle/regular_polygon/2
data modify storage large_number:math regular_polygon_Pos append from storage large_number:math temp1
scoreboard players operation #loops_θ large_number.int -= #temp_θ large_number.int
scoreboard players remove #loops large_number.int 1
execute if score #loops large_number.int matches 1.. run function large_number:particle/regular_polygon/loop
