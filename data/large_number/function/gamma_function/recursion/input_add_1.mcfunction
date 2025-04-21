data modify entity @s Pos[1] set from storage large_number:math store_gamma_function_input
execute at @s run tp ~ ~1 ~
data modify storage large_number:math store_gamma_function_input set from entity @s Pos[1]
tp .0 .0 .0
