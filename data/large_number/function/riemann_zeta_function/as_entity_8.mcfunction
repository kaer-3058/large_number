data modify entity @s Pos[1] set from storage large_number:math temp1
execute at @s run tp .0 ~1.0 .0
data modify storage large_number:math store_zeta_function_inp set from entity @s Pos[1]
tp .0 .0 .0
