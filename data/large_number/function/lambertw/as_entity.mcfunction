data modify entity @s Pos[1] set from storage large_number:math temp_ln1
execute at @s run function large_number:lambertw/macro1 with storage large_number:math
execute if score #temp_lambertw.input_size int matches 35..300 at @s run tp .0 ~-.0652815162477 .0
data modify storage large_number:math lambertw.output set from entity @s Pos[1]
tp .0 .0 .0
