#ln(x)-1/(2x)
data modify entity @s Pos[1] set from storage large_number:math ln_double.output
execute at @s run function large_number:digamma_function/macro2 with storage large_number:math

#ln(x)-1/(2x)-1/(12(x^2))
execute at @s run function large_number:digamma_function/macro4 with storage large_number:math float_reciprocal

data modify storage large_number:math temp_digamma_function_out set from entity @s Pos[1]
tp .0 .0 .0
