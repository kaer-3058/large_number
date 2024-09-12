execute store result entity @s Rotation[0] float 0.00000019280029806152200975042 run data get storage large_number:math lambertw.input 1000000000

execute rotated as @s rotated ~ 0.0 positioned .0 .0 .0 run tp @s ^1.0 ^ ^ ~ ~

execute store result score #temp1 int run data get entity @s Pos[2] 1000000000
execute store result score #temp2 int run data get entity @s Pos[0] 10000
execute store result storage large_number:math lambertw.output double 0.000003125 run scoreboard players operation #temp1 int /= #temp2 int
tp .0 .0 .0
