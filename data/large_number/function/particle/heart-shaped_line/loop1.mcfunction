execute at @s run function large_number:particle/heart-shaped_line/2
execute store result entity @s Rotation[0] float -0.0001 run scoreboard players operation #loop_d int += #heart-shaped_line.t_d int
execute unless score #loop_d int matches 900001.. run function large_number:particle/heart-shaped_line/loop1
