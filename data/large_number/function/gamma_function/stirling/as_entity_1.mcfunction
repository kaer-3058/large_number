data modify entity @s Pos[1] set from storage large_number:math float_reciprocal.output
execute at @s run tp ~ ~1.0 ~
data modify storage large_number:math temp_1+m/x set from entity @s Pos[1]
tp .0 .0 .0