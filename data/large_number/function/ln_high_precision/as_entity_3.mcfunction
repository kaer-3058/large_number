data modify entity @s Pos[1] set from storage large_number:math sstemp_kln2
execute at @s run function large_number:ln_high_precision/macro3 with storage large_number:math
execute at @s run function large_number:ln_high_precision/macro4 with storage large_number:math
execute at @s run function large_number:ln_high_precision/macro5 with storage large_number:math
execute at @s run function large_number:ln_high_precision/macro6 with storage large_number:math
data modify storage large_number:math ln_high_precision.output set from entity @s Pos[1]
tp @s .0 .0 .0 .0 .0
