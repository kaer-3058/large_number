#loop
execute store result entity @s Rotation[0] float .0001 run scoreboard players get #loop int
data modify storage large_number:math s0 set from entity @s Pos
data modify storage large_number:math s1 set from entity @s Rotation
execute at @s run function large_number:particle/star_line/2/macro3 with storage large_number:math
data modify storage large_number:math star_line_Pos append from entity @s Pos
data remove storage large_number:math star_line_Pos[-1][1]
data modify entity @s Pos set from storage large_number:math s0
data modify entity @s Rotation set from storage large_number:math s1

scoreboard players operation #loop int += #star_line.step.θ int
execute if score #loop int <= #loop.rule int run function large_number:particle/star_line/2/loop
