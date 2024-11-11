function large_number:particle/star_line/2/macro3 with storage large_number:math
data modify storage large_number:math star_line_Pos append from entity @s Pos
data remove storage large_number:math star_line_Pos[-1][1]

tp @s ~ ~ ~ ~ ~
