execute store result storage large_number:math buffer_all_xyz[0] double .001 run scoreboard players get #dx int
execute store result storage large_number:math buffer_all_xyz[1] double .001 run scoreboard players get #dy int
execute store result storage large_number:math buffer_all_xyz[2] double .001 run scoreboard players get #dz int
data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute at @s facing .0 .0 .0 run tp @s .0 .0 .0 .0 ~
execute store result storage large_number:math temp int 1 run data get entity @s Rotation[1] 100
