data modify entity @s Pos[1] set from storage large_number:math temp_ff2
execute at @s run function large_number:ln_high_precision/remez/macro1 with storage large_number:math
data modify storage large_number:math float_multiply.input2 set from entity @s Pos[1]
