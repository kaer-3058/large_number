#加上均值
data modify entity @s Pos[1] set from storage large_number:math q0
execute at @s run function large_number:random/normal_distribution/test2/macro2 with storage large_number:math random_normal_distribution
data modify storage large_number:math random_normal_distribution.output set from entity @s Pos[1]
tp .0 .0 .0
