data modify entity @s Pos[1] set from storage large_number:math float_division.output
execute at @s run tp ~ ~-.5 ~
execute at @s run function large_number:inverse_gamma_function/macro2 with storage large_number:math float_reciprocal
data modify storage large_number:math inverse_gamma_function.output set from entity @s Pos[1]
tp .0 .0 .0