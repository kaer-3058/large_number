data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute positioned .0 .0 .0 facing entity @s feet run tp @s .0 .0 .0 ~ ~
execute store result score #para.launch_angle.x large_number.int run data get entity @s Rotation[0] 10000
execute store result score #para.launch_angle.y large_number.int run data get entity @s Rotation[1] 10000
