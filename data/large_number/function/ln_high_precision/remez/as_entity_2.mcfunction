data modify entity @s Pos[1] set from storage large_number:math float_multiply.output
execute at @s run tp ~ ~.2857142874366239149 ~
data modify storage large_number:math float_multiply.input2 set from entity @s Pos[1]