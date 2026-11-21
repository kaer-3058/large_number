tp @s .0 .0 .0 ~ ~
execute store result score #atan2d large_number.int run data get entity @s Rotation[0] -1000000
data modify storage large_number:math tx set string storage large_number:math temp_x 0 1
data modify storage large_number:math ty set string storage large_number:math temp_y 0 1
execute unless data storage large_number:math {tx:"-"} unless data storage large_number:math {ty:"-"} unless score #atan2d large_number.int matches 0..90000000 run scoreboard players add #atan2d large_number.int 360000000
execute if data storage large_number:math {tx:"-"} unless data storage large_number:math {ty:"-"} unless score #atan2d large_number.int matches 90000000..180000000 run scoreboard players add #atan2d large_number.int 360000000
execute if data storage large_number:math {tx:"-"} if data storage large_number:math {ty:"-"} unless score #atan2d large_number.int matches -180000000..-90000000 run scoreboard players remove #atan2d large_number.int 360000000
execute unless data storage large_number:math {tx:"-"} if data storage large_number:math {ty:"-"} unless score #atan2d large_number.int matches -90000000..0 run scoreboard players remove #atan2d large_number.int 360000000
execute if score #atan2d large_number.int matches -180000000 run scoreboard players set #atan2d large_number.int 180000000
execute store result storage large_number:math atan2_double.output double .000001 run scoreboard players get #atan2d large_number.int
