data modify entity @s Pos[1] set from storage large_number:math float_multiply.output
execute at @s run tp ~ ~.6666666666666735130 ~
data modify storage large_number:math float_multiply.input2 set from entity @s Pos[1]