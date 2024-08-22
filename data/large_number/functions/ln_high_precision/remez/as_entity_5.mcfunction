data modify entity @s Pos[1] set from storage large_number:math float_multiply.output
execute at @s run tp ~ ~.3999999999940941908 ~
data modify storage large_number:math float_multiply.input2 set from entity @s Pos[1]
tp @s .0 .0 .0 .0 .0