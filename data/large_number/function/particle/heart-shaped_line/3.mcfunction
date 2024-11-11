#cos
execute store result entity @s Rotation[0] float .0001 run scoreboard players operation #temp1 int /= #heart-shaped_line.t2 int
execute rotated as @s rotated ~ .0 positioned .0 .0 .0 run tp @s ^1.0 ^ ^ ~ ~
execute store result score #temp1 int run data get entity @s Pos[0] 10000
