data modify entity @s Pos[1] set from storage large_number:math float_division.output
execute at @s run tp ~ ~-1.0 ~
data modify storage large_number:math sstemp_f set from entity @s Pos[1]
execute at @s run tp ~ ~2.0 ~
data modify storage large_number:math float_division.input2 set from entity @s Pos[1]
tp @s .0 .0 .0 .0 .0