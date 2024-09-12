data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute at @s run function large_number:particle/bezier_curve_2/macro2 with storage large_number:math
data modify storage large_number:math buffer_all_xyz set from entity @s Pos
tp .0 .0 .0
