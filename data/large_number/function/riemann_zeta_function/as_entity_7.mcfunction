data modify entity @s Pos[1] set from storage large_number:math float_multiply.output
execute at @s run tp .0 ~5.0 .0
data modify storage large_number:math float_division.input2 set from entity @s Pos[1]
tp .0 .0 .0
