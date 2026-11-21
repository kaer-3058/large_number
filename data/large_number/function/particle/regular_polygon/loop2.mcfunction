data modify storage large_number:math temp1 append from entity @s Pos
data remove storage large_number:math temp1[-1][1]
data modify storage large_number:math temp1[-1] append from storage large_number:math temp1[-1][0]
data remove storage large_number:math temp1[-1][0]
execute at @s run function large_number:particle/regular_polygon/macro4 with storage large_number:math
scoreboard players operation #sstemp4 large_number.int += #regular_polygon.size large_number.int
execute unless score #sstemp4 large_number.int > #regular_polygon.one_length large_number.int run function large_number:particle/regular_polygon/loop2
