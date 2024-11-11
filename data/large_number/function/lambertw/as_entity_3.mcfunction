data modify entity @s Pos[1] set from storage large_number:math temp_ln1
execute at @s run function large_number:lambertw/macro4 with storage large_number:math
data modify storage large_number:math lambertw.output set from entity @s Pos[1]
tp .0 .0 .0
