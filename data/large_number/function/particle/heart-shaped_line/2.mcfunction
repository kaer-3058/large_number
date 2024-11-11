function large_number:particle/heart-shaped_line/macro1 with storage large_number:math
data modify storage large_number:math sstemp0 set from entity @s Pos
data remove storage large_number:math sstemp0[1]
data modify storage large_number:math heart-shaped_line_Pos append from storage large_number:math sstemp0
tp @s ~ ~ ~ ~ ~
