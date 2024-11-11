execute store result score #temp1 int run data get storage large_number:math conical_selection_area.angle 10000
execute store result entity @s Rotation[0] float .0001 run scoreboard players operation #temp1 int /= 2 const
execute rotated as @s rotated ~ .0 run tp @s ^1 ^ ^ ~ ~
execute store result storage large_number:math sstemp0 double .0001 run data get entity @s Pos[2] 20000
tp ^ ^ ^1