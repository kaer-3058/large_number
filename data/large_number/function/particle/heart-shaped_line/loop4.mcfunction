execute store result entity @s Pos[1] double 0.0001 run scoreboard players operation #di.pos int += #heart-shaped_line.t_x int
data modify storage large_number:math sstemp0 set from entity @s Pos
data remove storage large_number:math sstemp0[-1]
data modify storage large_number:math heart-shaped_line_Pos append from storage large_number:math sstemp0
scoreboard players remove #store_heart-shaped_line.extra int 1
execute if score #store_heart-shaped_line.extra int matches 1.. run function large_number:particle/heart-shaped_line/loop4
