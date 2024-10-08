execute rotated as @s positioned .0 .0 .0 run function large_number:particle/3d_ar_rotation_circle/macro1 with storage large_number:math
data modify storage large_number:math sstemp2 set from entity @s Pos

data modify storage large_number:math stemp1 set from storage large_number:math sstemp2[2]
function large_number:particle/3d_ar_ellipse/macro1 with storage large_number:math
function large_number:particle/3d_ar_ellipse/macro2 with storage large_number:math
data modify storage large_number:math sstemp2[2] set from storage large_number:math stemp1

#局部坐标转相对坐标
data modify storage large_number:math u set from storage large_number:math sstemp2[0]
data modify storage large_number:math w set from storage large_number:math sstemp2[2]

execute store result entity @s Rotation[0] float .001 run scoreboard players get #3d.ellipse.roll.θ int
execute positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_ellipse/uvwtoxyz_2 with storage large_number:math
data modify storage large_number:math sstemp2 set from entity @s Pos
data remove storage large_number:math sstemp2[1]

data modify storage large_number:math 3d_ar_ellipse_pos append from storage large_number:math sstemp2

#递归
execute store result entity @s Rotation[0] float -0.1 run scoreboard players operation #loop int -= #3d.circle.angle int
execute if score #loop int matches 1.. run function large_number:particle/3d_ar_ellipse/loop
