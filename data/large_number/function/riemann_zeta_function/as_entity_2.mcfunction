data modify entity @s Pos[1] set from storage large_number:math float_multiply.output
execute at @s run tp .0 ~.5 .0
data modify storage large_number:math temp_zeta_function_t_02 set from entity @s Pos[1]
tp .0 .0 .0
