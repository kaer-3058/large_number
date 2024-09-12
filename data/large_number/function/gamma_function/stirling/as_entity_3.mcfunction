data modify entity @s Pos[1] set from storage large_number:math float_reciprocal.output
execute at @s run function large_number:gamma_function/stirling/macro2 with storage large_number:math
data modify storage large_number:math gamma_function.output set from entity @s Pos[1]
tp .0 .0 .0