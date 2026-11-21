data modify entity @s Pos[1] set from storage large_number:math stemp_gamma_function_inp.x
execute at @s run tp ~ ~1.0 ~
data modify storage large_number:math stemp_gamma_function_inp.x set from entity @s Pos[1]
tp .0 .0 .0
