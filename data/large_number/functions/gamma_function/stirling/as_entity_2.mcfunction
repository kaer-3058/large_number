data modify entity @s Pos[1] set from storage large_number:math gamma_function.input
execute at @s run tp ~ ~1.0 ~
data modify storage large_number:math float_reciprocal.input set from entity @s Pos[1]
tp .0 .0 .0