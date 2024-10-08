#局部坐标转相对坐标
execute store result entity @s Rotation[0] float .0001 run scoreboard players get #star_line.roll int

data modify storage large_number:math u set from storage large_number:math star_line_Pos[0][0]
data modify storage large_number:math w set from storage large_number:math star_line_Pos[0][1]
execute positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_ellipse/uvwtoxyz_2 with storage large_number:math
data modify storage large_number:math star_line_Pos[0] set from entity @s Pos
data remove storage large_number:math star_line_Pos[0][1]

data modify storage large_number:math u set from storage large_number:math star_line_Pos[1][0]
data modify storage large_number:math w set from storage large_number:math star_line_Pos[1][1]
execute positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_ellipse/uvwtoxyz_2 with storage large_number:math
data modify storage large_number:math star_line_Pos[1] set from entity @s Pos
data remove storage large_number:math star_line_Pos[1][1]

data modify storage large_number:math u set from storage large_number:math star_line_Pos[2][0]
data modify storage large_number:math w set from storage large_number:math star_line_Pos[2][1]
execute positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_ellipse/uvwtoxyz_2 with storage large_number:math
data modify storage large_number:math star_line_Pos[2] set from entity @s Pos
data remove storage large_number:math star_line_Pos[2][1]

data modify storage large_number:math u set from storage large_number:math star_line_Pos[3][0]
data modify storage large_number:math w set from storage large_number:math star_line_Pos[3][1]
execute positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_ellipse/uvwtoxyz_2 with storage large_number:math
data modify storage large_number:math star_line_Pos[3] set from entity @s Pos
data remove storage large_number:math star_line_Pos[3][1]

tp .0 .0 .0
