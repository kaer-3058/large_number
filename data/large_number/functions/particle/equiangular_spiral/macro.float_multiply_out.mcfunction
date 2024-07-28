$data modify entity @s Rotation[1] set value $(temp1)E$(temp2)f
$execute rotated as @s run tp ^ ^ ^$(temp3)
data modify storage large_number:math equiangular_spiral_out_listX append from entity @s Pos[2]
data modify storage large_number:math equiangular_spiral_out_listY append from entity @s Pos[1]