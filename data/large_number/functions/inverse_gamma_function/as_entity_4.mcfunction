execute store result storage large_number:math buffer_all_xyz[0] double -0.0001 run scoreboard players get #y int
execute store result storage large_number:math buffer_all_xyz[2] double 0.0001 run scoreboard players get #x int
data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute positioned .0 .0 .0 facing entity @s feet rotated ~ .0 run tp @s .0 .0 .0 ~ ~

execute store result entity @s Pos[1] double .00000001 run data get entity @s Rotation[0] 1745329
execute at @s run tp ~ ~2.032428471763296619 ~
data modify storage large_number:math inverse_gamma_function.output set from entity @s Pos[1]
tp .0 .0 .0
