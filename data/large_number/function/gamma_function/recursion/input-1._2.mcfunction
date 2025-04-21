data modify entity @s Pos[1] set from storage large_number:math float_multiply.input1
execute at @s run tp ~ ~-1 ~
data modify storage large_number:math float_multiply.input1 set from entity @s Pos[1]
tp .0 .0 .0
