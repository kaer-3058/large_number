data modify entity @s Pos[1] set from storage large_number:math float_multiply.output
execute at @s run function large_number:ln_high_precision/remez/macro1 with storage large_number:math
data modify storage large_number:math sstemp_rz set from entity @s Pos[1]
execute at @s run function large_number:ln_high_precision/macro2 with storage large_number:math
data modify storage large_number:math float_multiply.input2 set from entity @s Pos[1]
tp @s .0 .0 .0 .0 .0