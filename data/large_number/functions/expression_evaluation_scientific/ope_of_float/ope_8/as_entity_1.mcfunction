data modify entity @s Rotation[0] set from storage large_number:math temp2
execute rotated as @s rotated ~ 0.0 positioned .0 .0 .0 run tp @s ^1.0 ^ ^ ~ ~
data modify storage large_number:math _expressionss3 set from entity @s Pos[2]
