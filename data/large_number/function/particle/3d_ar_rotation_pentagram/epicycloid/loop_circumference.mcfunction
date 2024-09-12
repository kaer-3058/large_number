execute store result storage large_number:math temp1 double .0001 run scoreboard players get #temp_circu_r int
execute rotated as @s run function large_number:particle/3d_ar_rotation_pentagram/epicycloid/macro2 with storage large_number:math
data modify storage large_number:math 3d_ar_rotation_pentagram_pos append from entity @s Pos
data remove storage large_number:math 3d_ar_rotation_pentagram_pos[-1][1]
