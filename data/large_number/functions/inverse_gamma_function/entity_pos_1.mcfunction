data modify entity @s Pos[1] set from storage large_number:math ln_high_precision.output
execute at @s run tp ~ ~-.9189385332047 ~
data modify storage large_number:math float_multiply.input1 set from entity @s Pos[1]
tp .0 .0 .0