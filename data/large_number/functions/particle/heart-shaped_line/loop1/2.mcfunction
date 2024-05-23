data modify storage large_number:math s0 set from entity @s Pos
data modify storage large_number:math s1 set from entity @s Rotation
execute at @s run function large_number:particle/heart-shaped_line/macro1 with storage large_number:math
data modify storage large_number:math sstemp0 set from entity @s Pos
data remove storage large_number:math sstemp0[-1]
data modify storage large_number:math heart-shaped_line_Pos append from storage large_number:math sstemp0
data modify entity @s Pos set from storage large_number:math s0
data modify entity @s Rotation set from storage large_number:math s1
execute store result entity @s Rotation[1] float -0.01 run scoreboard players operation #loop_d int -= #heart-shaped_line.t_d int
execute unless score #loop_d int matches ..-1 run function large_number:particle/heart-shaped_line/loop1/2
