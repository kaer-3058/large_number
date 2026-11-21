data modify entity @s Pos[1] set from storage large_number:math store_zeta_function_inp
execute at @s run tp .0 ~-3.8 .0
data modify storage large_number:math temp1 set from entity @s Pos[1]
tp .0 .0 .0
