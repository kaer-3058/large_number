data modify entity @s Pos[1] set from storage math float_multiply.input1
execute at @s run tp @s ~ ~-1 ~
data modify storage math float_multiply.input1 set from entity @s Pos[1]
tp @s 0.0 0.0 0.0