execute rotated as @s positioned .0 .0 .0 run function large_number:particle/3d_ar_rotation_circle/macro1 with storage large_number:math
data modify storage large_number:math buffer_all_xyz set from entity @s Pos

#x
data modify storage large_number:math 3d_ar_rotation_circle_posX append from storage large_number:math buffer_all_xyz[0]

#y
data modify storage large_number:math 3d_ar_rotation_circle_posY append from storage large_number:math buffer_all_xyz[2]

#递归
execute store result entity @s Rotation[0] float -0.1 run scoreboard players operation #loop int -= #3d.circle.angle int
execute if score #loop int matches 1.. run function large_number:particle/3d_ar_rotation_circle/loop
