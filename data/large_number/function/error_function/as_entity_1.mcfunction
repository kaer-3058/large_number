data modify entity @s Pos[1] set from storage large_number:math sstemp06
execute at @s run tp ~ ~1.0 ~
data modify storage large_number:math float_division.input2 set from entity @s Pos[1]

execute at @s run tp ~ ~.27323954473516268615 ~
data modify storage large_number:math float_division.input1 set from entity @s Pos[1]

tp .0 .0 .0
