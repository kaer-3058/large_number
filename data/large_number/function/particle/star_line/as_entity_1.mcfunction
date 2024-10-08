#局部坐标转相对坐标
execute store result entity @s Rotation[0] float .0001 run scoreboard players get #star_line.roll int

data modify storage large_number:math u set from storage large_number:math sstempu[0][0]
data modify storage large_number:math w set from storage large_number:math sstempu[0][1]
execute positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_ellipse/uvwtoxyz_2 with storage large_number:math
data modify storage large_number:math sstempu[0] set from entity @s Pos
data remove storage large_number:math sstempu[0][1]

data modify storage large_number:math u set from storage large_number:math sstempu[1][0]
data modify storage large_number:math w set from storage large_number:math sstempu[1][1]
execute positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_ellipse/uvwtoxyz_2 with storage large_number:math
data modify storage large_number:math sstempu[1] set from entity @s Pos
data remove storage large_number:math sstempu[1][1]

data modify storage large_number:math u set from storage large_number:math sstempu[2][0]
data modify storage large_number:math w set from storage large_number:math sstempu[2][1]
execute positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_ellipse/uvwtoxyz_2 with storage large_number:math
data modify storage large_number:math sstempu[2] set from entity @s Pos
data remove storage large_number:math sstempu[2][1]

data modify storage large_number:math u set from storage large_number:math sstempu[3][0]
data modify storage large_number:math w set from storage large_number:math sstempu[3][1]
execute positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_ellipse/uvwtoxyz_2 with storage large_number:math
data modify storage large_number:math sstempu[3] set from entity @s Pos
data remove storage large_number:math sstempu[3][1]

data modify storage large_number:math u set from storage large_number:math sstempu[4][0]
data modify storage large_number:math w set from storage large_number:math sstempu[4][1]
execute positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_ellipse/uvwtoxyz_2 with storage large_number:math
data modify storage large_number:math sstempu[4] set from entity @s Pos
data remove storage large_number:math sstempu[4][1]

data modify storage large_number:math u set from storage large_number:math sstempu[5][0]
data modify storage large_number:math w set from storage large_number:math sstempu[5][1]
execute positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_ellipse/uvwtoxyz_2 with storage large_number:math
data modify storage large_number:math sstempu[5] set from entity @s Pos
data remove storage large_number:math sstempu[5][1]

data modify storage large_number:math u set from storage large_number:math sstempu[6][0]
data modify storage large_number:math w set from storage large_number:math sstempu[6][1]
execute positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_ellipse/uvwtoxyz_2 with storage large_number:math
data modify storage large_number:math sstempu[6] set from entity @s Pos
data remove storage large_number:math sstempu[6][1]

data modify storage large_number:math u set from storage large_number:math sstempu[7][0]
data modify storage large_number:math w set from storage large_number:math sstempu[7][1]
execute positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_ellipse/uvwtoxyz_2 with storage large_number:math
data modify storage large_number:math sstempu[7] set from entity @s Pos
data remove storage large_number:math sstempu[7][1]

tp .0 .0 .0
