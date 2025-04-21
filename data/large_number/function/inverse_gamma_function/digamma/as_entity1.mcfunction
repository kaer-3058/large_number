data modify entity @s Pos[1] set from storage large_number:math ln_double.output
execute at @s run function large_number:inverse_gamma_function/digamma/macro2 with storage large_number:math float_reciprocal
data modify storage large_number:math digamma_function.output set from entity @s Pos[1]
tp .0 .0 .0