data modify entity @s Pos[1] set from storage large_number:math exp_any.input.expon
execute at @s run function large_number:exp_any/macro1 with storage large_number:math
data modify storage large_number:math temp_expon_decimal set from entity @s Pos[1]
tp .0 .0 .0