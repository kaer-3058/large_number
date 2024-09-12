tp @s .0 .0 .0 .0 .0
data modify entity @s Pos[1] set from storage large_number:math temp2
execute at @s run tp @s .0 ~.625 .0
data modify storage large_number:math sigmoid.output set from entity @s Pos[1]
tp @s .0 .0 .0 .0 .0