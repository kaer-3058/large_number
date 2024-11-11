execute store result storage large_number:math buffer_all_xyz[0] double -0.0001 run scoreboard players get #y int
execute store result storage large_number:math buffer_all_xyz[2] double 0.0001 run scoreboard players get #x int
data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute positioned .0 .0 .0 facing entity @s feet rotated ~ .0 run tp @s .0 .0 .0 ~ ~

execute store result score #atan2d int run data get entity @s Rotation[0] 10000
execute if score #x int matches 0.. if score #y int matches 0.. unless score #atan2d int matches 0..900000 run scoreboard players add #atan2d int 3600000
execute if score #x int matches ..-1 if score #y int matches 0.. unless score #atan2d int matches 900000..1800000 run scoreboard players add #atan2d int 3600000
execute if score #x int matches ..-1 if score #y int matches ..-1 unless score #atan2d int matches -1800000..-900000 run scoreboard players remove #atan2d int 3600000
execute if score #x int matches 0.. if score #y int matches ..-1 unless score #atan2d int matches -900000..0 run scoreboard players remove #atan2d int 3600000

execute store result storage large_number:math temp1 double .0001 run scoreboard players get #atan2d int
execute store result entity @s Pos[1] double .00000001 run data get storage large_number:math temp1 1745329
execute at @s run tp ~ ~2.032428471763296619 ~
data modify storage large_number:math inverse_gamma_function.output set from entity @s Pos[1]
tp .0 .0 .0
